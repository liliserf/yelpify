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

    def business(id, data=nil)
      url = @business.build_url(id, data)
      get(url)
    end

    private

    def get(url)
      response = JSON.parse(access_token.get(url).body)
      Yelpify::Utils.convert_to_ostruct(response)
    end

  end
end