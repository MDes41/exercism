
class Binary

  VERSION = 2
  
  def initialize(number)
    if valid_binary_number?(number)
      @number = number
    else
      raise ArgumentError
    end
  end

  def to_decimal
    @number.chars.reverse.map.with_index do |number, index|
      number.to_i * (2 ** index)
    end.reduce(&:+)
  end

  def valid_binary_number?(number)
    number.chars.all? { |digit| %w(0 1).include?(digit) }
  end

end
