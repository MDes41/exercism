module Hamming

    VERSION = 1

  def self.compute(string1, string2)
    return raise ArgumentError if string1.length != string2.length
    zipped = string1.chars.zip(string2.chars)
    count = 0
    zipped.each do |letter1, letter2|
      count += 1 if letter1 != letter2
    end
    count
  end
end
