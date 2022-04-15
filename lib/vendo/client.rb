require "faraday"
require "faraday_middleware"

module Vendo
  class Client 
    API_ENDPOINT = 'https://demo.getvendo.com/api/v2/storefront'.freeze

    attr_accessor :order_token
    attr_reader :oauth_token, :user_name, :password

    def initialize(oauth_token = nil, order_token = nil, user_name = nil, password = nil)
      @oauth_token = oauth_token
      @order_token = order_token
      @user_name = user_name
      @password = password
    end

    def connection
      @connection = Faraday.new do |conn|
        conn.url_prefix = API_ENDPOINT
        conn.adapter Faraday.default_adapter
        conn.request :json
        conn.headers['Authorization'] = "Bearer #{oauth_token}" if oauth_token
        conn.headers['X-Vendo-Order-Token'] = "Order token #{order_token}" if order_token
        conn.response :json
        conn.headers['Content-Type'] = "application/json"
      end
    end

    def login(options = {})
      user = AccountResource.new(self).login(options)
      @oauth_token = user.access_token
      user
    end

    def cart
      CartResource.new(self)
    end

    def account
      AccountResource.new(self)
    end

    def line_item
      LineItemResource.new(self)
    end

    def coupon_code
      CouponResource.new(self)
    end

    def inspect
      "#<Vendo::Client>"
    end

  end
end