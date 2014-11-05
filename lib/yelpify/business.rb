require 'uri'

module Yelpify
  class Business
    def build_url(biz_id, search_data)
      base = "http://api.yelp.com/v2/business/#{biz_id}?"
      custom = URI.encode_www_form(search_data)
      path = base + custom
    end
  end
end

# the Business Class takes the business id
# and an optional hash of search data to 
# generate a path to use for the search in the 
# Client Class.