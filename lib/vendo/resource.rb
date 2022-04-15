module Vendo
  class Resource 
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get_request(url, params: {})
      client.connection.get(url, params)
    end

    def post_request(url, params: {})
      client.connection.post(url, params)
    end


  end
end