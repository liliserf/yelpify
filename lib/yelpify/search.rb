module Yelpify
  class Search
    def build_url(search_data)
      base = "http://api.yelp.com/v2/search?"
      custom = URI.encode_www_form(search_data)
      path = base + custom
    end
  end
end

# the Search Class takes a hash of search data to 
# generate a path to use for the search in the 
# Client Class.