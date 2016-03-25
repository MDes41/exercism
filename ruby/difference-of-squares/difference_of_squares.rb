class Squares

VERSION = 2

  def initialize (number)
    @number = number
  end

  def square_of_sum
    numbers.reduce do |sum, number|
      sum += number
    end ** 2
  end

  def numbers
    numbers_to_sum = (0..@number).to_a
  end

  def sum_of_squares
    numbers.reduce do |sum, number|
      sum += number ** 2
    end
  end

  def difference
    square_of_sum - sum_of_squares
  end

end
