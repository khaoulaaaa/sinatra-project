require 'sinatra/base'
require 'jwt'

module Sinatra
  module RightsHelper
    GLOBAL_RIGHTS = {
      'POST /users'                                  => {:require_auth => false,  :action => "before_create_user"},
      'PUT /users/:user_id'                          => {:require_auth => true,   :action => "before_update_user"},
      'GET /users'                                   => {:require_auth => true,   :action => "before_index_user"},
      'GET /users/:user_id'                          => {:require_auth => true,   :action => "before_get_user"}
    }

    def before_auth nothing
      return
    end

    def before_action(route, rights_params = {})
      rights = GLOBAL_RIGHTS[route]
      res = authenticate_jwt
      @jwt = false
      if res[:success] then
        @jwt_user = res[:user]
        @jwt = true
      end
      if rights && rights[:require_auth] && !res[:success]
        halt 401, {success: false}.to_json
      end
      send rights[:action], rights_params
    end
  end
  helpers RightsHelper
end
