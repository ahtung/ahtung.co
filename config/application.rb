require File.expand_path('../boot', __FILE__)

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ahtung
  # Application
  class Application < Rails::Application
    config.time_zone = 'Istanbul'

    config.i18n.available_locales = [:tr, :en]
    config.i18n.default_locale = :tr

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Include fonts folder to asset
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    # CORS
    config.middleware.insert_before 0, 'Rack::Cors', debug: true, logger: (-> { Rails.logger }) do
      allow do
        origins '*'
        resource '/cors',
          headers: :any,
          methods: [:post],
          credentials: true,
          max_age: 0

        resource '*',
          headers: :any,
          methods: [:get, :post, :delete, :put, :patch, :options, :head],
          max_age: 0
      end
    end
  end
end
