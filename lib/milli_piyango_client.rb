require 'open-uri'

class MilliPiyangoClient
  BASE_URL = "http://www.mpi.gov.tr/sonuclar/cekilisler".freeze

  def initialize(game_type)
    @game_type = game_type
  end

  def push_results
    result_day = "#{day}?"
    return if d_day.future?
    content = open(url).read
    result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
    week = JSON.parse(content)['data']['hafta']
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

  def apns_data(week, result)
    {
      default: '',
      ENV['APNS_KEY'] => apns_content(week, @game_type, result).to_json,
    }
  end

  def apns_content(week, result)
    {
      aps: {
        alert: "#{week}. hafta #{@game_type} Loto sonuçları:\n#{result}",
        sound: 'default',
        badge: 1
      }
    }
  end

  def aws_client
    Aws::SNS::Client.new
  end

  def push
    aws_client.publish({
      message: apns_data(week, @game_type, result).to_json,
      message_structure: 'json',
      target_arn: ENV['PLATFORM_ENDPOINT']
    })
  end
end
