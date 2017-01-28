require 'open-uri'

namespace :gele do
  namespace :sayisal do
    desc 'push sayisal loto results'
    task results: :environment do
      next unless Date.today.sunday?
      timestamp = Chronic.parse('last saturday').strftime('%Y%m%d')
      url = "http://www.mpi.gov.tr/sonuclar/cekilisler/sayisal/#{timestamp}.json"

      content = open(url).read
      result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
      week = JSON.parse(content)['data']['hafta']

      client = Aws::SNS::Client.new

      content = {
        aps: {
          alert: "#{week}. hafta Sayısal Loto sonuçları:\n#{result}",
          sound: 'default',
          badge: 1
        }
      }

      payload = {
        default: '',
        ENV['APNS_KEY'] => content.to_json
      }

      resp = client.publish({
        message: payload.to_json,
        message_structure: 'json',
        target_arn: ENV['PLATFORM_ENDPOINT']
      })
    end
  end

  namespace :super do
    desc 'push lottery results'
    task results: :environment do
      next unless Date.today.friday?
      timestamp = Chronic.parse('last thursday').strftime('%Y%m%d')
      url = "http://www.mpi.gov.tr/sonuclar/cekilisler/superloto/#{timestamp}.json"

      content = open(url).read
      result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
      week = JSON.parse(content)['data']['hafta']

      client = Aws::SNS::Client.new

      content = {
        aps: {
          alert: "#{week}. hafta Super Loto sonuçları:\n#{result}",
          sound: 'default',
          badge: 1
        }
      }

      payload = {
        default: '',
        ENV['APNS_KEY'] => content.to_json
      }

      resp = client.publish({
        message: payload.to_json,
        message_structure: 'json',
        target_arn: ENV['PLATFORM_ENDPOINT']
      })
    end
  end

  def get_results
    next unless Date.today.sunday?
    timestamp = Chronic.parse('last saturday').strftime('%Y%m%d')
    url = "http://www.mpi.gov.tr/sonuclar/cekilisler/sayisal/#{timestamp}.json"

    content = open(url).read
    result = JSON.parse(content)['data']['rakamlarNumaraSirasi']
    week = JSON.parse(content)['data']['hafta']

    client = Aws::SNS::Client.new

    resp = client.publish({
      message: apns_data.to_json,
      message_structure: 'json',
      target_arn: ENV['PLATFORM_ENDPOINT']
    })
  end

  def apns_data
    {
      default: '',
      APNS_SANDBOX: apns_content.to_json,
      APNS: apns_content.to_json
    }
  end

  def apns_content
    {
      aps: {
        alert: "#{week}. hafta Sayısal Loto sonuçları:\n#{result}",
        sound: 'default',
        badge: 1
      }
    }
  end
end
