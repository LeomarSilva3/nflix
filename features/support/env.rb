require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'report_builder'
require 'allure-cucumber'
require_relative "helpers"
require 'os'


World(Helpers)
#configuração de ambientes
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

#configuração para execução de browsers
    case ENV["BROWSER"]
    when "firefox"
        @driver = :selenium
    when "chrome"
        @driver = :selenium_chrome
    when "headless"
        Capybara.register_driver :selenium_chrome_headless do |app|
            chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
                options.add_argument "--headless"
                options.add_argument "--disable-gpu"
                options.add_argument "--no-sandbox"
                options.add_argument "--disable-site-isolation-trials"
            end
            Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
        end
        @driver = :selenium_chrome_headless
    else
        puts "Invalid Browser"
    end        

Capybara.configure do |config|
  config.default_driver = @driver#:selenium_chrome#_headless
  config.default_max_wait_time = 20
  config.app_host = CONFIG["url"]    
end 