class Phrase

  VERSION = 1

  def initialize(phrase)
    @counts = Hash.new(0)
    words = filter(phrase)
    put_words_into_hash(words)
  end

  def put_words_into_hash(words)
    words.each do |word|
      word[-1] = '' if word[-1] == "'"
      word[0] = '' if word[0] == "'"
      @counts[word.downcase] += 1
    end
  end

  def filter(phrase)
    phrase.tr("^A-Za-z0-9't", ' ').split
  end

  def word_count
    @counts
  end

end
