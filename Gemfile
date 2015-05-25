source 'https://rubygems.org'

gem 'rails', '4.2.1'
gem 'sqlite3'
gem 'thin'

gem 'sass-rails'
gem 'compass-rails', '~> 2.0.4'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'haml-rails'
gem 'slim-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-lodash'
  gem 'rails-assets-angular'
  gem 'rails-assets-angular-resource'
  gem 'rails-assets-angular-cookies'
  gem 'rails-assets-angular-animate'
  gem 'rails-assets-angular-sanitize'
  gem 'rails-assets-angular-route'
  gem 'rails-assets-angular-contenteditable'
  gem 'rails-assets-angular-lodash'
  gem 'rails-assets-ui-router'
  gem 'rails-assets-jstzdetect'
end

gem 'ng-rails-csrf'
gem 'gon'

gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'awesome_print'
  gem 'console_color'
  gem 'rspec-rails', '~> 3.0.1'
  gem 'byebug'
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
  gem 'capybara-angular'
  gem 'poltergeist'
  gem 'selenium-webdriver'
end

# All assets related stuff is here!
group :development do
  gem 'guard'
  gem 'guard-haml'
  gem 'guard-slim'
  gem 'guard-coffeescript'
  gem 'guard-uglify'
  gem 'guard-copy'
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console', '~> 2.0'
end
