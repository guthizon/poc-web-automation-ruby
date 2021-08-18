require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require_relative 'helper.rb'
require_relative 'page_helper.rb'

CONTEXTO = ENV['CONTEXTO']
BROWSER = ENV['BROWSER'].nil? ? 'firefox' : ENV['BROWSER']
HEADLESS = !ENV['HEADLESS'].nil? && ENV['HEADLESS'].eql?('sim')
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/contextos/#{CONTEXTO}.yml")
World(Helper)
World(Pages)


Capybara.register_driver :headless_firefox do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Firefox::Options.new
    browser_options.args << '-headless'
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: browser_options)
  end
  
  Capybara.register_driver :headless_chrome do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
        opts.args << '--headless'
        opts.args << '--disable-gpu' if Gem.win_platform?
        opts.args << '--disable-site-isolation-trials'
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
  end

  def get_driver(browser)
    driver = case browser
        when 'chrome' then HEADLESS ? :headless_chrome : :selenium_chrome
        when 'firefox' then HEADLESS ? :headless_firefox : :selenium
        when 'internet-explorer' then puts "The browser (#{browser}) was not setup yet."
        when 'edge' then "The browser (#{browser}) was not setup yet."
        else "The argument (#{browser}) is an invalid browser."
    end
    return driver
  end
    
  Capybara.javascript_driver = BROWSER.eql?('firefox') ? :firefox_headless : :headless_chrome
  
  Capybara.configure do |config|
    config.default_driver = get_driver(BROWSER)
    Capybara.page.driver.browser.manage.window.maximize
    config.app_host = CONFIG['url_padrao']
    config.default_max_wait_time = 60
  end