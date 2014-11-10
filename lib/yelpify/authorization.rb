require 'pry-byebug'
module Yelpify
  class Authorization
    attr_reader :credentials, :access_token

    def initialize(oauth_creds)
      @credentials    = oauth_creds

      consumer_key    = oauth_creds[:consumer_key]
      consumer_secret = oauth_creds[:consumer_secret]
      token           = oauth_creds[:token]
      token_secret    = oauth_creds[:token_secret]
      api_site        = {:site => "http://api.yelp.com"}

      if oauth_creds.values.any? {|v| v.empty? } 
        raise InvalidCredentials.new, "That was wrong"
      else
        consumer = OAuth::Consumer.new(consumer_key, consumer_secret, api_site)
        @access_token = OAuth::AccessToken.new(consumer, token, token_secret)
      end
      
    end
  end
end