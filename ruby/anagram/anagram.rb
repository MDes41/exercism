class Anagram

  def initialize(word)
    @word = word
  end

  def match(phrase)
    phrase.map do |word|
      word if array_true(word) && word.length == @word.length
    end.compact
  end

  def array_true(word)
    all_letters(word).all? { |true_false| true_false == TRUE }
  end

  def all_letters(word)
    word.chars.map do |letter|
      @word.include?(letter)
    end
  end
end
