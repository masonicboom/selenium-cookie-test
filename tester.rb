require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'selenium-webdriver'


describe "test" do
  before(:each) do
    @browser = Selenium::WebDriver.for(:firefox)
    @browser.manage.delete_all_cookies
  end
  
  after(:each) do
    @browser.quit
  end
  
  it "should receive a cookie" do
    @browser.manage.cookie_named(ENV['COOKIE_NAME']).should be_nil
    @browser.navigate.to ENV['SERVER_URL']
    @browser.manage.cookie_named(ENV['COOKIE_NAME']).should_not be_nil
    @browser.manage.cookie_named(ENV['COOKIE_NAME'])[:value].should == ENV['COOKIE_VALUE']
  end
end
