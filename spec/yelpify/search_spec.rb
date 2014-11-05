require 'spec_helper'

describe Yelpify::Search do
  before(:all) do
    @search_data = {
      "location" => "austin, texas",
      "category_filter" => "active,arts"
    }

  end

  describe '#build_url' do 
    it 'generates search path' do
      client       = Yelpify::Search.new
      url          = client.build_url(@search_data)
      expected_url = "http://api.yelp.com/v2/search?location=austin%2C+texas&category_filter=active%2Carts"

      expect(url).to eq(expected_url)
    end
  end 

end