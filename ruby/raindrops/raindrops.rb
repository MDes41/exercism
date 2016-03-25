class Raindrops

  VERSION = 1

  @convert = { 1 => "1", 3 => "Pling", 5 => "Plang", 7 => "Plong" }

  def self.convert(number)
    result = ''
    if number % 3 == 0
      result += @convert[3]
    end
    if number % 5 == 0
      result += @convert[5]
    end
    if number % 7 == 0
      result += @convert[7]
    end
    if number % 3 != 0 && number % 5 != 0 && number % 7 != 0
      result = number.to_s
    end
    result
  end

end
