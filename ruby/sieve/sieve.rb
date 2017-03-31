class Sieve

  def initialize(number)
    @number = number
  end

  def primes
    if @number < 2
      []
    else  
      all_numbers = (2..@number).to_a
      total = all_numbers.length
      factor = 2
      until (factor - 1) > total do
        all_numbers.delete_at(factor - 1)
        factor *= 2
      end
      all_numbers


    end
  end
end