module Vendo
  class AccountResource < Resource 

    # For authentication
    def login(**params)
     Account.new post_request("/spree_oauth/token", params: params).body
    end

    # For getting user account info
    def account_info
      Account.new get_request("account").body
    end
  end
end