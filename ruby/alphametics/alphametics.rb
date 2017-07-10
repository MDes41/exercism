class Alphametics
  attr_reader :arguments, :valuation

  def initialize(input)
    @arguments = get_arguments(input)
    @valuation = get_valuation(input)
  end

  def self.solve(input)
    new(input).solve
  end

  def solve
    Solve.new(arguments, valuation).solution
  end

  def get_arguments(input)
    / == /.match(input)
    $`.split(' + ')
  end

  def get_valuation(input)
    / == /.match(input)
    $'
  end

end

class Solve
  attr_reader :arguments, :valuation, :letters, :solution

  def initialize(arguments, valuation)
    @arguments = arguments
    @valuation = valuation
    @letters ||= all_letters(arguments.join + valuation)
  end

  def solution
    return {} if arguments.length == 1 && arguments[0] != valuation
    return {} if arguments.any? { |arg| arg.length > valuation.length }
    arguments.any? { |arg| arg.length > valuation.length }
    test_combos(letters)
    letters
  end

  def take_out_operators(input)
    input.tr('^A-Z', '')
  end

  def all_letters(input)
    take_out_operators(input).chars.sort.each_with_object({}) { |str, hsh| hsh[str] = 0}
  end

  def test_combos(letters)
    until solve_puzzle
      letters.map do |letter, _number|
        letters[letter] = rand(0..9)
      end
    end
  end

  def lookup(inputs)
    inputs = Array(inputs)
    result = inputs.map do |input|
      input.chars.map do |char| 
        letters[char] 
      end.join
    end.map(&:to_i)
    result.reduce(:+)
  end

  def solve_puzzle
    return false unless valid?
    lookup(arguments) == lookup(valuation)
  end

  def valid?
    letters.uniq? && letters[valuation[0]] != 0
  end
end

class Hash
  def uniq?
    self.values.uniq == self.values
  end
end