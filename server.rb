require 'sinatra'


get '/' do
  response.set_cookie(ENV['COOKIE_NAME'],
                      :value => ENV['COOKIE_VALUE'],
                      :domain => '',
                      :path => '/',
                      :expires => Time.now + (60 * 60 * 24 * 30))
end