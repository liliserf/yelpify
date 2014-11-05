require 'spec_helper'

describe Yelpify::Utils do

  describe '#convert_to_ostruct' do
    it "converts a hash to ostruct" do
      hash = {:a=>10, :b=>[100, 200, {n: 30}], :c=>{:x=>44, :y=>{:i=>11}}}


      ostruct = Yelpify::Utils.convert_to_ostruct(hash)

      expect(ostruct.c.y.i).to eq(11)
      expect(ostruct.b[2].n).to eq(30)
    end
  end

end