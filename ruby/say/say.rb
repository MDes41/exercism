class Say
  attr_reader :question, :factors, :place

  def initialize(question)
    @question = question
    @factors  = { "0" => 'zero',
                  "1" => 'one',
                  "2" => 'two',
                  "3" => 'three',
                  "4" => 'four',
                  "5" => 'five',
                  "6" => 'six',
                  "7" => 'seven',
                  "8" => 'eight',
                  "9" => 'nine',
                  "10" => 'ten',
                  "20" => 'twenty',
                  "30" => 'thirty',
                  "40" => 'forty',
                  "50" => 'fifty',
                  "60" => 'sixty',
                  "70" => 'seventy',
                  "80" => 'eighty',
                  "90" => 'ninety'

                }
    @place      = {
                    '0' => '',
                    '1' => 'teen',
                    '2' => 'hundred',
                    '3' => 'thousand',
                    '6' => 'million',
                    '9' => 'billion'
                  }
  end

  def in_english
    return factors[question.to_s] if factors[question.to_s]
    # require 'pry';binding.pry
    question.to_s.reverse.chars.map.with_index do |number, index|
      placeholder(number, index)
    end.check_tens_place(factors).reverse.compact.join(' ').rstrip
  end

  def placeholder(number, index)
    number == '0' ? nil : response(number, index)
  end

  def response(number, index)
    return ones_place(number, index)       if index < 1
    return tens_place(number, index)       if index == 1
    return hundreds_place(number, index)   if index > 1
  end

  def ones_place(number, index)    
    factors[number]
  end

  def tens_place(number, index)
    number == '1' ? place[index.to_s] : factors[number + '0']
  end

  def hundreds_place(number, index)
    [ factors[number] + " " + place[index.to_s] ]     
  end
end

class Array
  def check_tens_place(factors)
    if factors.key(self[1])
      self[1].replace(self.take(2).reverse.join('-'))
      self.shift
    elsif self[1] == 'teen'
      self[1].replace(self.take(2).join)
      self.shift
    end
    self
  end
end