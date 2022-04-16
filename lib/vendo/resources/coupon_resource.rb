module Vendo
  class CouponResource < Resource

    def apply_coupon(**attributes)
      Coupon.new patch_request("cart/apply_coupon_code", body: attributes).body
    end
  end
end