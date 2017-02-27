require 'sinatra'
require 'json'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/config_file'
require 'digest/sha1'
require 'jwt'
require "awesome_print"
require 'rollbar'

set :bind, '0.0.0.0'

# helpers
require './app/helpers/jwt_helper'
require './app/helpers/rights_helper'
require './app/helpers/users_rights_helper.rb'


# models
require './app/models/user.rb'

# controllers
require './app/controllers/user_controller.rb'

config_file 'config/secrets.yml'

Rollbar.configure do |config|
  config.access_token = settings.rollbar_token
end

before do
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST', 'PUT', 'PATCH','DELETE'],
          'Access-Control-Allow-Headers' => 'Content-Type'
end

# This is for CORS -- https://devblast.com/b/cors-with-angular-js-and-sinatra
options '*' do
  200
end


get '/' do
    res = {
        :app_name => 'mon projet Sinatra',
        :version => '1.0',
        :author => 'Mohamed Ali Charmi',
        :mail => 'medali@yusofleet.com'
    }
    content_type :json
    res.to_json
end

after do
    ActiveRecord::Base.connection.close
end
