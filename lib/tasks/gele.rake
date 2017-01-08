require 'open-uri'

namespace :gele do
  namespace :lottery do
    desc 'push lottery results'
    task results: :environment do
      timestamp = Chronic.parse('last saturday').strftime('%Y%m%d')
      url = "http://www.mpi.gov.tr/sonuclar/cekilisler/sayisal/#{timestamp}.json"
      content = open(url).read
      result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
      numbers = result.split(' - ')

      client = Aws::SNS::Client.new

      content = {
        aps: {
          alert: "",
          sound: result,
          badge: 1
        }
      }

      payload = {
        APNS_SANDBOX: content.to_json
      }

      resp = client.publish({
        message: payload.to_json,
        message_structure: 'json',
        target_arn: ENV['PLATFORM_ENDPOINT']
      })
    end
  end
end
