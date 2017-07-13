class Scrabble
  attr_reader :phrase, :s

  def initialize(phrase)
    @phrase = phrase
    @s = Hash.new(0)
    s['A'], s['E'], s['I'], s['O'], s['U'] = 1, 1, 1, 1, 1 
    s['N'], s['R'], s['S'], s['T'], s['L'] = 1, 1, 1, 1, 1
    s['D'], s['G']                         = 2, 2
    s['B'], s['C'], s['M'], s['P']         = 3, 3, 3, 3
    s['F'], s['H'], s['V'], s['W'], s['Y'] = 4, 4, 4, 4, 4
    s['K']                                 = 5
    s['J'], s['X']                         = 8, 8
    s['Q'], s['Z']                         = 10, 10
  end

  def score
    return 0 unless valid?
    phrase.scan(/[a-zA-Z]/).reduce(0) do |sum, letter|
      sum += score_each(letter)
    end
  end

  def self.score(phrase)
    new(phrase).score
  end

  def valid?
    phrase != nil 
  end

  def score_each(letter)
    s["#{letter.upcase}"]
  end
end
