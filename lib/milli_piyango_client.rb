require 'open-uri'

class MilliPiyangoClient
  BASE_URL = "http://www.mpi.gov.tr/sonuclar/cekilisler".freeze

  def initialize(game_type)
    @game_type = game_type
    @result = ''
  end

  def push_results
    return false unless correct_day?
    get_results && push
  rescue OpenURI::HTTPError => e
    false
  end

  def day
    return 'saturday' if @game_type == 'sayisal'
    return 'thursday' if @game_type == 'superloto'
  end

  private

  def lottery_day
    today = Chronic.parse("last weeks #{day}") if push_test?
    today = DateTime.now unless push_test?
    today.strftime('%Y%m%d')
  end

  def correct_day?
    return true if Rails.env.test?
    return true if push_test?
    Date.today.send("#{day}?")
  end

  def get_results
    content = open(url).read
    @result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
    true
  end

  def push_test?
    return false if Rails.env.test?
    ENV.fetch('APNS_KEY', 'APNS_SANDBOX') == 'APNS_SANDBOX'
  end

  def url
    [BASE_URL, @game_type, lottery_day].join('/') << '.json'
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
        sound: ENV.fetch('PUSH_SOUND', 'chime'),
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
    return true if Rails.env.test?
    aws_client.publish({
      message: apns_data.to_json,
      message_structure: 'json',
      target_arn: ENV['PLATFORM_ENDPOINT']
    })
  rescue
    false
  end
end
