require 'spec_helper'


describe Yelpify::Client do
    before(:all) do
      @creds = {
        :consumer_key    => ENV['YELP_KEY'], 
        :consumer_secret => ENV['YELP_SECRET'], 
        :token           => ENV['YELP_TOKEN'], 
        :token_secret    => ENV['YELP_TOKEN_SECRET']
      }
      # @auth = Yelpify::Authorization.new(@creds)
      # @new_search   = Yelpify::Search.new
      # @new_business = Yelpify::Business.new
      # @client       = Yelpify::Client.new(@auth.access_token, @new_search, @new_business)
      @client       = Yelpify.new_client(@creds)

    end

  describe '#initialize' do
    it 'initializes with access_token, search instance and business instance' do
      access_token = @client.access_token

      expect(access_token).to be_a(OAuth::AccessToken)
    end
  end

  describe '#search' do
    it "makes a search request" do
      search_data = {
        "location"        => "austin, texas",
        "category_filter" => "active,arts"
      }
      VCR.use_cassette('search') do
        response = @client.search(search_data)
        expect(response).to be_a(Hash)
      end
    end
  end

  describe '#business' do
    it "makes a business request" do
      id = "yelp-san-francisco"

      VCR.use_cassette('business') do
        response = @client.business(id)
        expect(response).to be_a(Hash)
      end
    end
  end

end

# test that a hash is returned
# instance_variable_get (look that up)