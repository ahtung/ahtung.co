ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
require 'coveralls'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter])
SimpleCov.start 'rails'

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end

require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'webmock/rspec'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include AbstractController::Translation
  config.include FactoryGirl::Syntax::Methods
  config.include Shoulda::Matchers::ActiveModel, type: :model
  config.include Shoulda::Matchers::ActiveRecord, type: :model

  config.order = 'random'
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.filter_run_excluding skip: true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.before(:each) do
    stub_request(:get, "http://www.mpi.gov.tr/sonuclar/cekilisler/sayisal/19690105.json").
      to_return(status: 404, body: '', headers: {})

    stub_request(:get, "http://www.mpi.gov.tr/sonuclar/cekilisler/sayisal/20170121.json").
      to_return(status: 200, body: { data: { rakamlarNumaraSirasi: '' } }.to_json, headers: {})

    stub_request(:get, "http://www.mpi.gov.tr/sonuclar/cekilisler/superloto/19690105.json").
      to_return(status: 404, body: '', headers: {})

    stub_request(:get, "http://www.mpi.gov.tr/sonuclar/cekilisler/superloto/20170121.json").
      to_return(status: 200, body: { data: { rakamlarNumaraSirasi: '' } }.to_json, headers: {})

    stub_request(:post, "https://sns.eu-central-1.amazonaws.com/").
      to_return(:status => 200, body: {}.to_xml, :headers => {})
  end

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!
end
