# class RailFenceCipher

#   VERSION = 1

#   def initialize(letter, rail)
#     @rails = rail
#     @letter = letter
#   end 

#   def self.encode(cypher,rails)
#     return cypher if rails == 1
#     rails = (0..rails - 1).to_a
#     result = rails.map { |rail| [] }
#     category = 0
#     direction = 1
#     cypher.chars.each_with_index do |char, index|
#       result[category] << cypher[index]
#       category += direction
#       direction = -1 if category == rails[-1]
#       direction = 1 if category == 0
#     end
#     return '' if result[0] == nil
#     result.compact.join
#   end


#   def self.decode(cypher,rails)
#     result = []
#     length = cypher.length
#     cypher.chars.each_with_index do |char, index|
#       division = length / rails
#       return result.join if index == division
#       result << cypher[index]
#       while division < length
#         result << cypher[index + division]
#         division += division
#       end
#     end
#     result.join
#   end
# end

class RailFenceCipher
  VERSION = 1

  def self.decode(ciphertext, rails)
    zigzag(rails, ciphertext.length).
      sort.
      zip(ciphertext.chars).
      sort_by { |a| a[0][1] }.
      map { |a| a[1] }.
      join
  end

  def self.encode(plaintext, rails)
    require 'pry';binding.pry
    zigzag(rails, plaintext.length).
      zip(plaintext.chars).
      sort.
      map { |a| a[1] }.
      join
  end

  def self.zigzag(rails, size)
    pattern = (0..rails - 1).to_a + (1..rails - 2).to_a.reverse
    pattern.cycle.first(size).zip(0..size)
  end
end