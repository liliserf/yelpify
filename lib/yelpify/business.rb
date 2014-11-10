require 'uri'

module Yelpify
  class Business
    def build_url(biz_id, search_data=nil)
      base = "http://api.yelp.com/v2/business/#{biz_id}?"
      if search_data
        custom = URI.encode_www_form(search_data)
        path = base + custom
      else
        path = base
      end
    end
  end
end