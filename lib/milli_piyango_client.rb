require 'open-uri'

class MilliPiyangoClient
  BASE_URL = "http://www.mpi.gov.tr/sonuclar/cekilisler".freeze

  def initialize(game_type)
    @game_type = game_type
    @result = ''
    @date = nil
    @test = ENV.fetch('TEST', false)
  end

  def push_results(date = nil)
    @date = date
    result_day = "#{day}?"
    return if d_day.future?
    return if !Date.today.send(result_day) && !@test
    content = open(url).read
    @result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
    push
    true
  rescue OpenURI::HTTPError => e
    false
  end

  private

  def day
    return 'saturday' if @game_type == 'sayisal'
    return 'thursday' if @game_type == 'superloto'
  end

  def url
    timestamp = d_day.strftime('%Y%m%d')
    [BASE_URL, @game_type, timestamp].join('/') << '.json'
  end

  def d_day
    return @date if @date
    Chronic.parse(chronic_sentence)
  end

  def chronic_sentence
    return "last weeks #{day}" if @test
    "this weeks #{day}"
  end

  def apns_data
    {
      default: '',
      ENV['APNS_KEY'] => apns_content.to_json,
    }
  end

  def apns_content
    {
      aps: {
        alert: apns_alert,
        sound: 'default',
        badge: 1
      }
    }
  end

  def apns_alert
    "#{type} Loto çekildi. İşte sonuçlar!\n#{@result}"
  end

  def type
    return 'Sayısal' if @game_type == 'sayisal'
    return 'Süper' if @game_type == 'superloto'
  end

  def aws_client
    Aws::SNS::Client.new
  end

  def push
    aws_client.publish({
      message: apns_data.to_json,
      message_structure: 'json',
      target_arn: ENV['PLATFORM_ENDPOINT']
    })
  rescue
    true
  end
end
