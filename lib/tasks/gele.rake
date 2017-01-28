require 'open-uri'

namespace :gele do
  namespace :sayisal do
    desc 'push sayisal loto results'
    task results: :environment do
      get_results(:sayisal)
    end
  end

  namespace :super do
    desc 'push lottery results'
    task results: :environment do
      get_results(:superloto)
    end
  end

  def get_results(game_type)
    result_day = "#{day}?"
    next unless Date.today.send(result_day)
    result_url = url(game_type)

    content = open(result_url).read
    result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
    week = JSON.parse(content)['data']['hafta']

    client = Aws::SNS::Client.new

    resp = client.publish({
      message: apns_data(week, game_type, result).to_json,
      message_structure: 'json',
      target_arn: ENV['PLATFORM_ENDPOINT']
    })
  end

  def day(game_type)
    return 'saturday' if game_type == :sayisal
    return 'thursday' if game_type == :superloto
  end

  def url(game_type)
    chronic_sentence = "this #{day(game_type)}"
    timestamp = Chronic.parse(chronic_sentence).strftime('%Y%m%d')
    "#{base_url}#{game_type}/#{timestamp}.json"
  end

  def base_url
    "http://www.mpi.gov.tr/sonuclar/cekilisler/"
  end

  def apns_data(week, game_type, result)
    {
      default: '',
      ENV['APNS_KEY'] => apns_content(week, game_type, result).to_json,
    }
  end

  def apns_content(week, game_type, result)
    {
      aps: {
        alert: "#{week}. hafta #{game_type} Loto sonuçları:\n#{result}",
        sound: 'default',
        badge: 1
      }
    }
  end
end
