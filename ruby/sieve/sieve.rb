class Sieve

  def initialize(number)
    @number = number
  end

  def primes
    if @number < 2
      []
    else  
      all_numbers = (2..@number).to_a
      total = all_numbers.dup.length
      result = all_numbers.dup
      all_numbers.each_with_index do |number, i|
        factor = all_numbers[i].to_i
        until factor + i > total
          result[i + factor] = nil 
          factor = all_numbers[i] + factor
        end
      end
      result.map do |number|
        number
      end.compact
    end
  end
end