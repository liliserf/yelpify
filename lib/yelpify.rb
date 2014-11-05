require "oauth"
require "json"
require "uri"
require 'dotenv'

require "yelpify/client"
require "yelpify/search"
require "yelpify/business"
require "yelpify/authorization"
require "yelpify/version"
require "yelpify/errors/invalid_credentials"
Dotenv.load

module Yelpify
  def self.new_client(oauth_data={})
    raise "No OAuth data!" if oauth_data.empty?
    
    search   = Yelpify::Search.new
    business = Yelpify::Business.new
    token    = Yelpify::Authorization.new(oauth_data)

    Yelpify::Client.new(token.access_token, search, business)
  end
end

# #self.new_client creates a new yelp client that can 
# makes API calls. The method raises an error if the user
# does not pass through a hash of OAuth data. 
# first, a new isntance of the Search Class is instantiated.
# second, a new instance of the Business Class is instantiated.
# third, a new instance of the Authorization Class is instantiated.
# this is because the client needs access to all of these classes
# in order to build the paths and call them through OAuth.
# the final Yelpify::Client.new takes the instances of search
# and business and pulls the access_token from the Authorization
# class and enables the user to begin calling the API using
# client.search and client.business