class RunLengthEncoding
  def self.encode(input)
    result_hash = Hash.new(0)
    input.chars.map do |letter|
      result_hash[letter] += 1
    end
    result_string = ''
    result_hash.each do |letter, quantity|
      result_string << quantity.to_s if quantity != 0
      result_string << letter
    end
    result_string
  end

  def self.decode(input)
    multiplyer = 1
    input.chars.map do |character|
      multiplyer = character if number?(character) == true
      "#{character}" * multiplyer.to_i if number?(character) == false
    end
  end

  def self.number?(character)
    (1..9).to_a.map(&:to_s).include?(character)
  end
end
