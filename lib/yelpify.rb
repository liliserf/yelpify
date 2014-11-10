require "oauth"
require "json"
require "uri"
require "dotenv"
require "ostruct"

require "yelpify/client"
require "yelpify/search"
require "yelpify/business"
require "yelpify/authorization"
require "yelpify/version"
require "yelpify/errors/invalid_credentials"
require "yelpify/utils"

Dotenv.load

module Yelpify
  def self.create_new(oauth_data={})
    raise "No OAuth data!" if oauth_data.empty?
    
    search   = Yelpify::Search.new
    business = Yelpify::Business.new
    token    = Yelpify::Authorization.new(oauth_data)

    Yelpify::Client.new(token.access_token, search, business)
  end
end