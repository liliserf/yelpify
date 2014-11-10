module Yelpify
  class Search
    def build_url(search_data)
      base = "http://api.yelp.com/v2/search?"
      custom = URI.encode_www_form(search_data)
      path = base + custom
    end
  end
end