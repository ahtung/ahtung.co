require 'open-uri'

class MilliPiyangoClient
  BASE_URL = "http://www.mpi.gov.tr/sonuclar/cekilisler".freeze

  def initialize(game_type)
    @game_type = game_type
    @result = ''
  end

  def push_results
    result_day = "#{day}?"
    return if d_day.future?
    content = open(url).read
    @result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
    push
  rescue OpenURI::HTTPError => e
    if e.message == '404 Not Found'
      puts 'No results'
    end
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
    Chronic.parse(chronic_sentence)
  end

  def chronic_sentence
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
  end
end
