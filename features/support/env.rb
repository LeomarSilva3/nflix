require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "rspec"
require "os"
require 'report_builder'
require 'allure-cucumber'

require_relative "helpers"

World(Helpers)

# case ENV["BROWSER"]

# when "firefox"
#   @driver = :selenium
# when "chrome"
#   @driver = :selenium_chrome
# when "headless"
#   @driver = :selenium_chrome_headless
# else
#    puts "Invalid Browser"
# end       

Capybara.configure do |config|
  #config.default_driver = :selenium
  config.default_driver = :selenium_chrome
  config.app_host = "localhost:8000/login"
  #config timeout implicit
  config.default_max_wait_time = 10
end    

