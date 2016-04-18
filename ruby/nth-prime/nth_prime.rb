class Prime


  def self.nth(number)
    if number == 0
      raise(ArgumentError)
    else
      array = [2]
      200000.times do |num|
        if array.count == number
          return array.last
        elsif array.last < num
          divisable = array.find do |i|
            num % i == 0
          end
          array << num if divisable == nil
        end
      end
    end
  end

end
