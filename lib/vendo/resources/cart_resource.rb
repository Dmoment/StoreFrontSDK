module Vendo
  class CartResource < Resource

    def retrieve
      Cart.new get_request("cart").body.dig("data")
    end

    def create(**attributes)
      cart = Cart.new post_request("cart", body: attributes).body.dig("data")
      @client.order_token = cart.dig("attributes", "token")
      cart
    end
  end
end