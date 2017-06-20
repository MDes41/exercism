class PrimeFactors
  def self.for(number)
    final = [number]
    result = []
    loop do 
      break if number == 1
      break if result.reduce(:*) == final.first
      divisor = 2
      while divisor <= final.first
        if number % divisor != 0
          divisor += 1
        elsif number == divisor
          result << divisor
          divisor += 1
        else
          number = number / divisor
          result << divisor
          divisor += 1
        end
      end
    end
    result
  end
end