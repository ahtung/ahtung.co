namespace :gele do
  desc 'push loto results'
  task :push_loto_results, [:game_type, :test_env] => [:environment] do |t, args|
    game_type = args[:game_type]
    test_env = args[:test_env]
    milli_piyango_client = MilliPiyangoClient.new game_type, test_env
    milli_piyango_client.push_results
  end
end
