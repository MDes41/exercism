class Alphametics
  def initialize(input)
    @input = input.chars
  end

  def self.solve(input)
    get_result(input)
    get_arguments(input)
  end

  def self.get_result(input)
    / == /.match("#{input}")
    $'
  end

  def self.get_arguments(input)
    / == /.match("#{input}")
    $`
  end
end