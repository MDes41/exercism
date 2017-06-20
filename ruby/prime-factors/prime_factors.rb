#all working but needs to be cleaned up
class PrimeFactors
  def self.for(number)
    final = [number]
    result = []
    divisor = 2
    loop do 
      break if number == 1
      break if result.reduce(:*) == final.first
      while divisor <= final.first
        if number % divisor != 0
          divisor += 1
        elsif number == divisor
          result << divisor
          divisor = final.first + 1
        else
          number = number / divisor
          result << divisor
        end
      end
    end
    result
  end
end