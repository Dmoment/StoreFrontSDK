
RSpec.describe 'CouponResource' do
  before(:each) do
    @client = Vendo::Client.new()
     VCR.use_cassette("setup authenticated user") do
      @response = @client.login(grant_type: "password", username: "vendo@example.com", password: "vendo123")
     end
  end

  context "Apply coupon" do 
    it 'should return error message of invalid coupon' do
      VCR.use_cassette("apply coupon") do
        req_body ={"coupon_code": "DISCOUNT10"}
        @res = @client.coupon_code.apply_coupon(req_body)
        expect(@res.error).to match("The coupon code you entered doesn't exist. Please try again.")
      end
    end
  end
end