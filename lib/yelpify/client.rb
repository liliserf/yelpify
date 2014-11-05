module Yelpify
  class Client
    attr_reader :access_token

    def initialize(access_token, search, business)
      @search = search
      @business = business
      @access_token = access_token
    end

    def search(data)
      url = @search.build_url(data)
      get(url)
    end

    def business(id, data)
      url = @business.build_url(id, data)
      get(url)
    end

    private

    def get(url)
      response = access_token.get(url).body
      JSON.parse(response)
    end

  end
end

# #initialize creates a new yelp client using the access_token
# from the Authorization Class. 

# acess_token has an attr_reader so that it can be called
# from the Yelpify module?

# #search calls to the Search Class to generate a new search 
# path using the hash of data passed in. it then calls the 
# #get(url) from within the Client Class to generate the API
# call and send it through OAuth (using the access_token) and
# return a parsed JSON object.

# The same thing happens in #business.