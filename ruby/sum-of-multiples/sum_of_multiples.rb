class SumOfMultiples

  def initialize(*args)
    @multiples = args
  end

  def to(max_number)
    result = (1..(max_number - 1)).to_a.find_all do |number|
      multiples_of(number)
    end
    return 0 if result == []
    result.reduce(&:+)
  end

  def multiples_of(number)
    @multiples.any? do |multiple|
      number % multiple == 0
    end
  end
end
