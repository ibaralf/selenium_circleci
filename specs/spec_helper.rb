require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'yaml'
require 'yarjuf'

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


end