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
end
