# frozen_string_literal: true

require 'rspec/expectations'
require 'capybara'
require 'capybara/rspec'
require 'capybara-screenshot'
require 'capybara-screenshot/rspec'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'appium_lib'
require 'appium_capybara'
require 'pry'
require 'time'
#require 'rspec_html_formatter'
# require 'support/utils/adb'
# require 'support/utils/path'
# require 'support/utils/screen'

# support files
# SPEC_ROOT = File.expand_path(File.dirname(__FILE__))
# Dir[File.expand_path('support/**/*.rb', SPEC_ROOT)].each { |f| require f }

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.order = 'default'

  # config.include ::ScreenUtil
  # config.include ::PathUtil

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    config.include Capybara::DSL
    config.include Capybara::RSpecMatchers
  end

  config.before do |example|
    #start_screenrecord
  end

  config.after do |test|
    #stop_screenrecord
    #example.metadata[:screenrecord] = screenrecord_rel_path(pull_screenrecord)

   # if example.exception
    #  test.metadata[:failed_screenshot] = screenshot_rel_path(take_screenshot)
    #end
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Capybara::DSL

  Capybara.configure do |config|
    config.app_host = 'https://storefront-azure.mimercado.com'
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
      # puts all_options.inspect

      Appium::Capybara::Driver.new app, all_options
    end
    Capybara.default_driver = :appium
    config.app_host = 'https://storefront-azure.mimercado.com'
    config.default_max_wait_time = 40
  else
    config.default_driver = @driver
    config.javascript_driver = @driver
    config.app_host = 'https://storefront-azure.mimercado.com'
    config.default_max_wait_time = 40
  end
end

  Capybara.add_selector(:dt) do
    css { |v| "*[data-testid=#{v}]" }
  end

  Capybara.add_selector(:nm) do
    css { |v| "*[name=#{v}]" }
  end

  Capybara.add_selector(:ip) do
    css { |v| "*[itemprop=#{v}]" }
  end
end
