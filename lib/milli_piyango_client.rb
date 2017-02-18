require 'open-uri'

class MilliPiyangoClient
  BASE_URL = "http://www.mpi.gov.tr/sonuclar/cekilisler".freeze

  def initialize(game_type)
    @game_type = game_type
    @result = ''
    @date = nil
  end

  def push_results
    set_date
    get_results && push
  rescue OpenURI::HTTPError => e
    false
  end

  def get_results
    return false unless correct_day?
    content = open(url).read
    @result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
  end

  def correct_day?
    return true if test?
    Date.today.send("#{day}?")
  end

  def set_date
    @date = Chronic.parse(chronic_sentence)
  end

  def test?
    return false if ENV['RAILS_ENV']
    ENV.fetch('APNS_KEY', 'APNS_SANDBOX') == 'APNS_SANDBOX'
  end

  def day
    return 'saturday' if @game_type == 'sayisal'
    return 'thursday' if @game_type == 'superloto'
  end

  def url
    timestamp = @date.strftime('%Y%m%d')
    [BASE_URL, @game_type, timestamp].join('/') << '.json'
  end

  def chronic_sentence
    return "last weeks #{day}" if test?
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
    false
  end
end
