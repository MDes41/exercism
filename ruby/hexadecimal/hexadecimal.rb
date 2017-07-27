class Hexadecimal

  attr_reader :base, :number

  def initialize(number)
    @number = number  
    @base = { "0" => 0, 
              "1" => 1, 
              "2" => 2, 
              "3" => 3, 
              "4" => 4, 
              "5" => 5, 
              "6" => 6, 
              "7" => 7, 
              "8" => 8, 
              "9" => 9, 
              "a" => 10, 
              "b" => 11, 
              "c" => 12, 
              "d" => 13, 
              "e" => 14, 
              "f" => 15
            }
  end

  def to_decimal
    number.chars.reverse.each_with_index.reduce(0) do |sum, (hex, index)|
      return 0 if !base[hex]
      sum += base[hex] * (16 ** index)
    end
  end

end