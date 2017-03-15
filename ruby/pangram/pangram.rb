class Pangram
  VERSION = 4
  def self.pangram?(phrase)
    alphabet = ('A'..'Z').to_a
    phrase = phrase.gsub(' ', '').upcase.split('')
    includes = alphabet.map do |alpha|
      phrase.include?(alpha)
    end
    includes.all?{|find| find == true }
  end
end