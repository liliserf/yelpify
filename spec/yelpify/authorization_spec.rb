require 'spec_helper'

describe Yelpify::Authorization do
  before(:all) do
    @creds = {
      :consumer_key    => "abc123", 
      :consumer_secret => "def456", 
      :token           => "ghi789", 
      :token_secret    => "jkl000"
    }

    @bad_creds = {
      :consumer_key    => "", 
      :consumer_secret => "", 
      :token           => "", 
      :token_secret    => ""
    }
  end
  
  describe '#initialize' do 
    it "sets credentials and access_token" do
      auth = Yelpify::Authorization.new(@creds)
      expect(auth.credentials).to eq(@creds)
      expect(auth.access_token).to_not be_nil
    end

    it "throws an error if the credentials are invalid" do
      expect {
        Yelpify::Authorization.new(@bad_creds)
      }.to raise_error(Yelpify::InvalidCredentials)
    end 
  end
end