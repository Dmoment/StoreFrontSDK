
RSpec.describe 'CartResouce' do
  before(:each) do
    @client = Vendo::Client.new()
     VCR.use_cassette("setup authenticated user") do
      @response = @client.login(grant_type: "password", username: "vendo@example.com", password: "vendo123")
     end
  end

  context "Create cart" do 
    it 'should return newly created cart' do
      VCR.use_cassette("create cart") do
        req_body = {
          "public_metadata": {
            "total_weight": 3250
          },
          "private_metadata": {
            "had_same_cart_items": true
          }
        }
        @cart_response = @client.cart.create(req_body)
      end
        expect(@cart_response.type).to match("cart")
        expect(@cart_response.attributes.number).to match("R861368695")
    end
  end

  context "retrieved cart info" do 
    it 'should return user details' do
      VCR.use_cassette("retrieve cart info") do 
        @cart_info = @client.cart.retrieve
      end
      expect(@cart_info.type).to match("cart")
      expect(@cart_info.attributes.number).to match("R861368695")
    end
  end
end