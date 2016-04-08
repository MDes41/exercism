class Robot

  attr_reader :name

  def initialize
    @name = random_letter(2) + random_number(3)
  end

  def random_letter(number)
    result = []
    number.times do
      result << ("A".."Z").to_a[rand(26)]
    end
    result.join
  end

  def random_number(number)
    result = []
    number.times do
      result << rand(1..9).to_s
    end
    result.join
  end

  def reset
    @name = random_letter(2) + random_number(3)
  end

end
