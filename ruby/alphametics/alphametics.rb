class Alphametics
  attr_reader :answer

  def initialize(input)
    @answer = Solve.new(take_out_operators(input))
  end

  def self.solve(input)
    new(input).answer
  end

  def take_out_operators(input)
    input.tr('^A-Z', '')
  end

end

class Solve
  attr_reader :letters

  def initialize(input)
    @letters ||= all_letters(input)
    @combos = combos(@letters)
  end

  def all_letters(input)
    letters = Hash.new(0)
    input.chars.each { |element| letters[element] = 0}
    letters
  end

  def test_combos(letter)
      (0..9).to_a.each do |i|
        letters[letter] += i
        return if (solve_puzzle(letters))
      end
  end

  def combos(letters)
    letters.each do |letter|
      test_combos(letter)
    end
  end

  def solve_puzzle(letters)
    return false if letters.reduce(0) { |sum,k| k[1] } == 0 
    "#{@letters['I']}" + "#{@letters['B']}#{@letters['B']}" == "#{@letters['I']}#{@letters['L']}#{@letters['L']}"
  end
end