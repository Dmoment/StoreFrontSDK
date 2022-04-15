module Vendo
  class LineItemResource < Resource
    def add_item(**attributes)
      LineItem.new post_request("cart/add_item", body: attributes).dig("data")
    end

    def set_quantity(**attributes)
      LineItem.new patch_request("cart/set_quantity", body: attributes).dig("data")
    end

    def delete(id:)
      delete_request("cart/remove_line_item/#{id}")
      true
    end
  end
end