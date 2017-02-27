require 'sinatra/base'
require 'jwt'

module Sinatra
  module JWTHelper
    def encode_jwt(payload, rsa_key, encrypt)
      token = JWT.encode payload, rsa_key, encrypt
      return token
    end

    def decode_jwt(token)
      JWT.decode token, nil, false
    end

    def authenticate_jwt
      jwt = request.env['HTTP_AUTHORIZATION']
      if jwt && !jwt.blank? then
        payload = decode_jwt jwt
        if payload[0]["exp"].to_i < Time.now.to_i then
          return {success: false}
        else
          user = User.find(JSON.parse(payload[0]["user"])["id"])
          return {success: true, user: user}
        end
      else
        return {success: false}
      end
    end
  end
  helpers JWTHelper
end
