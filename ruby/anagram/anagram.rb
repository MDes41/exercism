class Anagram

  def initialize(word)
    @word = word.downcase
  end

  def match(phrase)
    result = phrase.map do |word|
      word if array_true(word.downcase) && word.length == @word.length
    end.compact
    delete_identical(result, phrase)
  end

  def array_true(word)
    all_letters(word).all? { |true_false| true_false == TRUE }
  end

  def all_letters(word)
    dup_word = @word.dup
    word.chars.map.with_index do |letter, index|
      if dup_word.include?(letter)
        dup_word[index] == ""
        TRUE
      end
    end
  end

  def delete_identical(result, phrase)
    h = Hash.new(0)
    phrase = phrase.map { |word| word.downcase }
    phrase.each { |word| h[word] += 1 }
    result.delete_if { |word| h[word] > 1}
  end

end
