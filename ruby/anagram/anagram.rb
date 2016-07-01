class Anagram

  def initialize(word)
    @word = word
  end

  def match(phrase)
    phrase.map do |word|
      word if match_letters(word).all? { |true_false| true_false == TRUE }
    end
  end

  def match_letters(word)
    word.chars.map do |letter|
      @word.include?(letter)
    end
  end
end
