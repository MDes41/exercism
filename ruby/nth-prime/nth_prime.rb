class Prime


  def self.nth(number)
    if number == 0
      raise(ArgumentError)
    else
      create_next_prime(number)
    end
  end

  def self.create_next_prime(number)
    array = [2]
    1000000.times do |num|
      if array.count == number
        return array.last
      elsif array.last < num && divisable(array, num) == nil
        array << num
      end
    end
  end

  def self.divisable(array, num)
    divisable = array.find do |i|
      num % i == 0
    end
  end

end


#didn't know how to implement with other methods kept getting singlton
#error.  Realized I only had to put self infront of the methods
# class Prime
#
#
#   def self.nth(number)
#     if number == 0
#       raise(ArgumentError)
#     else
#       array = [2]
#       200000.times do |num|
#         if array.count == number
#           return array.last
#         elsif array.last < num
#           divisable = array.find do |i|
#             num % i == 0
#           end
#           array << num if divisable == nil
#         end
#       end
#     end
#   end
#
# end
