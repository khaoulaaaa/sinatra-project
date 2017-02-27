require 'sinatra/base'

module Sinatra
  module UserRightsHelper
    def find_user
      @user = User.find(params[:user_id])
    end

    def before_create_user rights_params
      return
    end

    def before_update_user rights_params
      find_user
    end

    def before_index_user rights_params
      return
    end

    def before_get_user rights_params
      find_user
    end

  end
  helpers UserRightsHelper
end
