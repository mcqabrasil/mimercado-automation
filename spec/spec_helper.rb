# frozen_string_literal: true

require 'rspec/expectations'
require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'appium_capybara'
require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    config.include Capybara::DSL
    config.include Capybara::RSpecMatchers
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL
end

Capybara.configure do |config|
  config.app_host = 'https://storefront-qa.mimercado.com'
end

@browser = ENV['BROWSER']

Capybara.configure do |config|
  @driver = case @browser
            when 'chrome'
              :selenium_chrome
            when 'chrome_headless'
              :selenium_chrome_headless
            when 'android'
              :appium
            end

  if @driver == :appium
    caps = Appium.load_appium_txt file: File.expand_path('./', 'appium.txt'), verbose: true

    url = 'http://localhost:4723/wd/hub'

    Capybara.register_driver(:appium) do |app|
      all_options = caps.merge(appium_lib: { server_url: url }, global_driver: false, elementScrollBehavior: 1)
      puts all_options.inspect

      Appium::Capybara::Driver.new app, all_options
    end
    Capybara.default_driver = :appium
    config.app_host = 'https://storefront-qa.mimercado.com'
    config.default_max_wait_time = 15
  else
    config.default_driver = @driver
    config.javascript_driver = @driver
    config.app_host = 'https://storefront-qa.mimercado.com'
    config.default_max_wait_time = 15
  end

  Capybara.add_selector(:dt) do
    css { |v| "*[data-testid=#{v}]" }
  end

  Capybara.add_selector(:nm) do
    css { |v| "*[name=#{v}]" }
  end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
end