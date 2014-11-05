require 'spec_helper'

describe Yelpify::Business do
    before(:all) do
    @search_data = {}
    
    @id = "yelp-san-francisco"

  end

  describe '#build_url' do 
    it 'generates search path' do
      client = Yelpify::Business.new
      url = client.build_url(@id, @search_data)
      expected_url = "http://api.yelp.com/v2/business/yelp-san-francisco?"

      expect(url).to eq(expected_url)
    end
  end 
end