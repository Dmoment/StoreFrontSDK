
RSpec.describe 'AccountResouce' do
  before(:each) do
    @client = Vendo::Client.new()
     VCR.use_cassette("setup authenticated user") do
      @response = @client.login(grant_type: "password", username: "vendo@example.com", password: "vendo123")
     end
  end

  context "Authentication by logging in by username and password" do 
    it 'should return Bearer token' do
        expect(@response.token_type).to match("Bearer")
    end
  end

  context "retrieved logged in user account info" do 
    it 'should return user details' do
      VCR.use_cassette("retrieve account info") do 
        @response = @client.account.account_info
      end
      expect(@response.data.attributes.email).to match("vendo@example.com")
      expect(@response.data.attributes.first_name).to match("joseph")
      expect(@response.data.attributes.last_name).to match("gwaka")
    end
  end
end