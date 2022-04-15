require "faraday"
require "faraday_middleware"

module Vendo
  class Client 
    API_ENDPOINT = 'https://demo.getvendo.com/api/v2/storefront'.freeze

    attr_reader :oauth_token, :user_name, :password

    def initialize(oauth_token = nil, user_name = nil, password = nil)
      @oauth_token = oauth_token
      @user_name = user_name
      @password = password
    end

    def connection
      @connection = Faraday.new do |conn|
        conn.url_prefix = API_ENDPOINT
        conn.adapter Faraday.default_adapter
        conn.request :json
        conn.headers['Authorization'] = "Bearer #{oauth_token}" if oauth_token
        conn.response :json
        conn.headers['Content-Type'] = "application/json"
      end
    end

    def login(options = {})
      user = AccountResource.new(self).login(options)
      @oauth_token = user.access_token
      user
    end

    def account_info
      AccountResource.new(self).account_info
    end

    def inspect
      "#<Vendo::Client>"
    end

  end
end