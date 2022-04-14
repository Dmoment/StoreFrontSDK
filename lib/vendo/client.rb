require "faraday"
require "faraday_middleware"

module Vendo
  class Client 
    API_ENDPOINT = 'https://demo.getvendo.com/api/v2/storefront'.freeze

    attr_reader :oauth_token

    def initialize(oauth_token = nil)
      @oauth_token = oauth_token
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

    def inspect
      "#<Vendo::Client>"
    end

  end
end