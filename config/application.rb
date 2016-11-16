require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'pdfkit'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Codeskull
  class Application < Rails::Application

	config.autoload_paths += %W(#{config.root}/lib)

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'pt-BR'

    config.active_record.raise_in_transactional_callbacks = true

    # TODO move this to enviroments/development.rb and set S3 configs in production
    config.paperclip_defaults = { storage: :fog, 
        fog_credentials: { 
            provider: "Local", 
            local_root: "#{Rails.root}/public"
        }, 
        fog_directory: "", 
        fog_host: "http://localhost:8081"
    }

    config.generators do |generator|
        generator.test_framework :rspec, fixture: true
        generator.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    Elasticsearch::Model.client = Elasticsearch::Client.new host: 'elasticsearch'

    config.middleware.use PDFKit::Middleware, {}, :only => %r[\/tracks\/[0-9]+\/export]

    PDFKit.configure do |config|
        config.wkhtmltopdf = `which wkhtmltopdf`.strip
        config.default_options = {
            :encoding=> 'UTF-8',
            :page_width => '210',
            :page_height => '297'
        }
    end

  end
end
