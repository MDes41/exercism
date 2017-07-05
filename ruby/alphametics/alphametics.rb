class Alphametics
  attr_reader :answer

  def initialize(input)
    @valuation = get_result(input)
    @arguments = get_arguments(input)
    @answer = Solve.new([@arguments, @valuation])
  end

  def self.solve(input)
    new(input).answer
  end

  def get_result(input)
    /== /.match("#{input}")
    $'
  end

  def get_arguments(input)
    /==/.match("#{input}")
    take_out_operators($`.split)
  end

  def take_out_operators(input)
    input.find_all { |letter| letter != '+'}
  end

end

class Solve
  attr_reader :letters

  def initialize(input)
    @result = input[1]
    @arguments = input[0]
    @letters ||= all_letters(input)
    @combos = test_combos(@letters)
  end

  def all_letters(input)
    letters = Hash.new(0)
    input.join.chars.each { |element| letters[element] = 0}
    letters
  end

  def test_combos(letters)
    return if (solve_puzzle(letters))
    9.times do |i|
      value = letters.select { |k,v| v < i }.keys.first
      letters[value] += 1
      test_combos(letters)
    end
  end

  # def test_numbers(letter)
  #   0..9.times do |i|
  #     letters[letter] = i
  #   end
  # end

  def solve_puzzle(letters)
    return false if letters.reduce(0) { |sum,k| k[1] } == 0 
    "#{@letters['I']}" + "#{@letters['B']}#{@letters['B']}" == "#{@letters['I']}#{@letters['L']}#{@letters['L']}"
  end
end