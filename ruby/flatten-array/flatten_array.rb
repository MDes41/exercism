class FlattenArray

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
    else
      mixed_arr[0] == Array
      flatten_number(mixed_arr.shift)
      flatten(mixed_arr)
    end
    result
  end

  def flatten_number(number)
    return if number == []
    if number[0].class == Fixnum
      result << number.shift
      flatten_number(number)
    end
  end

  # def self.flatten(mixed_arr)
  #   result = []
  #   while mixed_arr[0] != ''
  #     if mixed_arr[0].class == Fixnum
  #       result << mixed_arr.shift
  #       self.flatten(mixed_arr)
  #     elsif mixed_arr[0].class == Array
  #       mixed_arr[0] = mixed_arr[0].first
  #       self.flatten(mixed_arr)
  #     end
  #   end
  #   result
  # end


  # def self.flatten(mixed_arr)
  #   result = []
  #   if mixed_arr[0].class == Array
  #     mixed_arr[0] = mixed_arr[0].first
  #     flatten(mixed_arr)
  #   end
  #   result << mixed_arr.shift
  #   mixed_arr.map do |number|
  #     while number.class == Array
  #       number = number.map { |num| num }
  #     end
  #   end
  #   result
  # end
end

