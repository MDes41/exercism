class RailFenceCipher

  VERSION = 1

  def initialize(letter, rail)
    @rails = rail
    @letter = letter
  end 

  def self.encode(cypher,rails)
    return cypher if rails == 1
    rails = (0..rails - 1).to_a
    result = rails.map { |rail| [] }
    category = 0
    direction = 1
    cypher.chars.each_with_index do |char, index|
      result[category] << cypher[index]
      category += direction
      direction = -1 if category == rails[-1]
      direction = 1 if category == 0
    end
    return '' if result[0] == nil
    result.compact.join
  end


  def self.decode(cypher,rails)
    result = []
    length = cypher.length
    cypher.chars.each_with_index do |char, index|
      division = length / rails
      return result.join if index == division
      result << cypher[index]
      while division < length
        result << cypher[index + division]
        division += division
      end
    end
    result.join
  end
end