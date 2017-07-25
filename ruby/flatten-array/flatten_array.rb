class FlattenArray
  VERSION = 1

  attr_reader :result

  def initialize
    @result     = []
  end

  def self.flatten(mixed_arr)
    new.flatten(mixed_arr)
  end


  def flatten(array_to_flat)
    result = []

    array_to_flat.each do |item|
      if item.is_a?(Array)
        result += flatten(item)
      else
        result += [item]
      end
    end

    return result.compact
  end
end
