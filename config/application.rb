require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module TestApp
  class Application < Rails::Application

    config.generators do |generate|
      generate.template_engine :haml
      generate.helper false
      generate.assets false
      generate.view_specs false
      generate.views false
    end

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru
    config.i18n.locale = :ru
    config.i18n.enforce_available_locales = true
    I18n.config.enforce_available_locales = true
    config.autoload_paths += %W(#{config.root}/lib)
    config.active_record.raise_in_transactional_callbacks = true
  end
end
