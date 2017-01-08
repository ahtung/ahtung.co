require 'open-uri'

namespace :gele do
  namespace :lottery do
    desc 'push lottery results'
    task results: :environment do
      timestamp = Chronic.parse('last saturday').strftime('%Y%m%d')
      url = "http://www.mpi.gov.tr/sonuclar/cekilisler/sayisal/#{timestamp}.json"

      # timestamp = Chronic.parse('last thursday').strftime('%Y%m%d')
      # url = "http://www.mpi.gov.tr/sonuclar/cekilisler/superloto/#{timestamp}.json"

      content = open(url).read
      result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
      week = JSON.parse(content)['data']['hafta']

      client = Aws::SNS::Client.new

      content = {
        aps: {
          alert: "#{week}. hafta Sayısal Loto sonuçları:\n#{result}",
          sound: result,
          badge: 1
        }
      }

      payload = {
        default: '',
        APNS_SANDBOX: content.to_json,
        APN: content.to_json
      }

      resp = client.publish({
        message: payload.to_json,
        message_structure: 'json',
        target_arn: ENV['PLATFORM_ENDPOINT']
      })
    end
  end
end
