class RunLengthEncoding

  VERSION = 1
  
  def self.encode(input)
    result_string = ''
    quantity = 1
    input.chars.each_with_index do |letter, index|
      if input.chars[index] == input.chars[index + 1]
        quantity += 1
        next
      else
        quantity = '' if quantity == 1
        result_string << quantity.to_s + letter
        quantity = 1
      end
    end
    result_string
  end

  def self.decode(input)
    multiplyer = ''
    result = ''
    input.chars.each_with_index do |character, index|
      if number?(character)
        multiplyer << character
        next if number?(input.chars[index + 1])
      else
        if multiplyer == ''
          result << "#{character}"
        else
          result << "#{character}" * multiplyer.to_i
        end
        multiplyer = ''
      end
    end
    result
  end

  def self.number?(character)
    (1..9).to_a.map(&:to_s).include?(character)
  end
end
