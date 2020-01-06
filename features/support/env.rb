# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'appium_capybara'

@browser = ENV['BROWSER']

Capybara.configure do |config|
  @driver = case @browser
            when 'chrome'
              :selenium_chrome
            when 'firefox'
              :selenium
            when 'chrome_headless'
              :selenium_chrome_headless
            when 'firefox_headless'
              :selenium_headless
            when 'android'
              :appium
            end

  if @driver == :selenium
    puts 'Driver selected is Firefox'
    Capybara.register_driver :selenium do |app|
      caps = Selenium::WebDriver::Remote::Capabilities.new(acceptInsecureCerts: true, :elementScrollBehavior => 1)
      Capybara::Selenium::Driver.new(
        app,
        desired_capabilities: caps
      )
    end
    config.app_host = 'http://front.mimercado.ztech.net'
    config.default_driver = :selenium
    config.javascript_driver = :selenium
    config.default_max_wait_time = 40

  elsif @driver == :appium
    caps = Appium.load_appium_txt file: File.expand_path('./', 'appium.txt'), verbose: true

    url = 'http://localhost:4723/wd/hub'

    Capybara.register_driver(:appium) do |app|
      all_options = caps.merge(appium_lib: { server_url: url }, global_driver: false)
      puts all_options.inspect

      Appium::Capybara::Driver.new app, all_options
    end

    Capybara.default_driver = :appium
    config.app_host = 'http://front.mimercado.ztech.net'
    config.default_max_wait_time = 40
  elsif
    config.default_driver = @driver
    config.javascript_driver = @driver
    config.app_host = 'http://front.mimercado.ztech.net'
    config.default_max_wait_time = 40
  end
end

Capybara.add_selector(:dt) do
  css { |v| "*[data-testid=#{v}]" }
end

Capybara.add_selector(:accessibility_id) do
  custom(:accessibility_id) { |locator| locator }
end

Capybara.add_selector(:nm) do
  css { |v| "*[name=#{v}]" }
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
