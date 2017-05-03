require_relative 'spec_helper'
require 'yaml'

describe 'CircleCI Integration', :smoketest do
  include Spec_Helper

  before :all do
    @session = create_driver_chrome()
  end

  it 'should load thredUp homepage' do
    @session.visit('https://thredup.com')
    result = @session.has_title? 'thredUP - The Largest Online Consignment & Thrift Store'
    expect(result).to equal true
  end

  after :all do
    @session.driver.quit
  end

end