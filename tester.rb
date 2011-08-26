require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'selenium-webdriver'


SERVER_URL = 'http://localhost:4567' # This is the Sinatra default.
COOKIE_NAME = 'tasty'


describe "test" do
  before(:each) do
    @browser = Selenium::WebDriver.for(:firefox)
    @browser.manage.delete_all_cookies
  end
  
  after(:each) do
    @browser.quit
  end
  
  it "should receive a cookie" do
    @browser.manage.cookie_named(COOKIE_NAME).should be_nil
    @browser.navigate.to SERVER_URL
    @browser.manage.cookie_named(COOKIE_NAME).should_not be_nil
  end
end
