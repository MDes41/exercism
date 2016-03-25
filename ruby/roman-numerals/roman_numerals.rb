class Fixnum

  VERSION = 1

  ROMANS = {  1000 => "M",
              900 => "CM",
              500 => "D",
              400 => "CD",
              100 => "C",
              90 => "XC",
              50 => "L",
              40 => "XL",
              10 => "X",
              9 => "IX",
              5 => "V",
              4 => "IV",
              1 => "I"}

  def to_roman
    roman_numeral = ""
    arabic_number = self
    ROMANS.each do |arabic, roman|
      while arabic_number >= arabic
        arabic_number -= arabic
        roman_numeral << roman
      end
    end
    roman_numeral
  end

end
