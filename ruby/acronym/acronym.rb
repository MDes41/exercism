class BookKeeping
  VERSION = 4
end

class Acronym
  def self.abbreviate(phrase)
    phrase.get_abbr_letters.join
  end
end

class String
  def get_abbr_letters
    self.tr('-',' ').split.map { |word| word[0].upcase }
  end
end
  

