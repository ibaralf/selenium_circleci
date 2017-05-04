require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'yaml'
require 'yarjuf'
require 'logger'

RSpec.configure do |config|
  include Capybara::RSpecMatchers
  config.color=true
  config.add_formatter(:documentation)
  config.add_formatter(JUnit,"./results/rspec_results.xml")
end


module Spec_Helper

  def create_driver_chrome()
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    Capybara.current_driver = :selenium
    return Capybara::Session.new(:selenium)
  end

  def create_artifacts_dirs()
    if ! File.directory?(File.dirname(__FILE__) + "/../logs")
      Dir.mkdir(File.dirname(__FILE__) + "/../logs")
    end
    if ! File.directory?(File.dirname(__FILE__) + "/../screenshots")
      Dir.mkdir(File.dirname(__FILE__) + "/../screenshots")
    end
  end

  def create_and_initialize_log
    log_directory = File.dirname(__FILE__) + "/../logs"
    if ! File.directory?(log_directory)
      Dir.mkdir(log_directory)
    end
  end

  def take_screenshot(session)
    logname = "/../logs/auto_log.txt"
    logfile = File.dirname(__FILE__) + logname
    shot_file = File.dirname(__FILE__) + "/../screenshots/" + "screenshot.png"
    @logger = Logger.new(logfile, 10, 1024000)
    @logger.info("Taking screenshot #{shot_file}")
    session.save_screenshot(shot_file)
  end

end