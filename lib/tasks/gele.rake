require 'open-uri'

namespace :gele do
  namespace :sayisal do
    desc 'push sayisal loto results'
    task results: :environment do
      MilliPiyangoClient.new.get_results(:sayisal)
    end
  end

  namespace :super do
    desc 'push lottery results'
    task results: :environment do
      MilliPiyangoClient.new.get_results(:superloto)
    end
  end
end
