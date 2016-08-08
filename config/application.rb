require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Codeskull
  class Application < Rails::Application

	config.autoload_paths += %W(#{config.root}/lib)

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'pt-BR'

    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |generator|
        generator.test_framework :rspec, fixture: true
        generator.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    Elasticsearch::Model.client = Elasticsearch::Client.new host: 'elasticsearch'
    
  end
end
