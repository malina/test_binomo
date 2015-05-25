require 'capybara'
require 'capybara/poltergeist'

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new

  # Turn off the accessibility redirect popup
  profile["network.http.prompt-temp-redirect"] = false

  Capybara::Selenium::Driver.new(
      app, :browser => :firefox, :profile => profile
  )
end

Capybara.default_driver = :selenium