class FlattenArray
  VERSION = 1

  attr_reader :result

  def initialize
    @result = []
  end

  def self.flatten(mixed_arr)
    new.flatten(mixed_arr)
  end

  def flatten(mixed_arr)
    mixed_arr.compact!
    mixed_arr.shift if mixed_arr[0] == []
    return result if mixed_arr == []
    if mixed_arr[0].class == Fixnum
      result << mixed_arr.shift
      flatten(mixed_arr)
    elsif mixed_arr[0].class == Array
      flatten(mixed_arr.unshift(mixed_arr[0].shift))
    end
  end
end

