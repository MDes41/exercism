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
    return result if mixed_arr == []
    if mixed_arr[0].class == Fixnum
      result << mixed_arr.shift
      flatten(mixed_arr)
    elsif mixed_arr[0] == nil
      mixed_arr.shift
      flatten(mixed_arr)
    elsif mixed_arr[0].class == Array
      if mixed_arr[0] == []
        mixed_arr.shift
        flatten(mixed_arr)
      else
        flatten(mixed_arr.unshift(mixed_arr[0].shift))
      end
    end
  end
end

