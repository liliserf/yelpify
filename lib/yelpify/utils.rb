module Yelpify
  class Utils

    def self.convert_to_ostruct(val)
      if val.class == Hash
        new_val = {}
        val.each do |key, value|
          new_val[key] = convert_to_ostruct(value)
        end
        OpenStruct.new(new_val)
      elsif val.class == Array
        new_val = []
        val.each do |x|
          new_val << convert_to_ostruct(x)
        end
        new_val
      else
        val
      end
    end
  end
end