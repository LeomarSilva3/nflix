require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "rspec"
require "os"
require "report_builder"

require_relative "helpers"

World(Helpers)

Capybara.configure do |config|
  #config.default_driver = :selenium
  config.default_driver = :selenium_chrome#_headless
  config.app_host = "localhost:8080/login"
  #config timeout implicit
  config.default_max_wait_time = 5
end    