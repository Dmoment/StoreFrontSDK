
RSpec.describe 'LineItemResource' do
  before(:each) do
    @client = Vendo::Client.new()
     VCR.use_cassette("setup authenticated user") do
      @response = @client.login(grant_type: "password", username: "vendo@example.com", password: "vendo123")
     end
  end

  context "Add line item in the cart" do 
    it 'should return newly created cart' do
      VCR.use_cassette("add line item") do
        req_body = {
          "variant_id": "980a80d5-f51b-4065-b3a0-622fc5cb6bf6",
          "quantity": 5,
          "public_metadata": {
            "total_weight": 3250
          },
          "private_metadata": {
            "had_same_cart_items": true
          }
        }
        expect{ @client.line_item.add_item(req_body) }.to raise_error(
           #<Vendo::Error: The resource you were looking for could not be found.>
        )
      end
    end
  end
end