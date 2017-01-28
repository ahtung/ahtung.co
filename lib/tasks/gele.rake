require 'open-uri'

namespace :gele do
  desc 'push loto results'
  task push_loto_results: :environment do |t, args|
    game_type = args[:game_type]
    milli_piyango_client = MilliPiyangoClient.new game_type
    milli_piyango_client.push_results
  end
end
