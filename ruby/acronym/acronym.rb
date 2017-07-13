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
  
# class Acronym
#   def self.abbreviate(string)
#     require 'pry';binding.pry
#     string.scan(/\b[a-z]/i).join.upcase
#   end
# end

# module BookKeeping
#   VERSION = 4
# end

