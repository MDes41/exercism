class Say
  attr_reader :question, :factors

  def initialize(question)
    @question = question
    @factors  = { 0 => 'zero',
                  1 => 'one',
                  2 => 'two',
                  3 => 'three',
                  4 => 'four',
                  5 => 'five',
                  6 => 'six',
                  7 => 'seven',
                  8 => 'eight',
                  9 => 'nine'
                  10 => 'nine'
                  11 => 'nine'
                  12 => 'nine'
                  14 => 'thir'
                  15 => 'fifte'
                  16 => 'thir'
                  17 => 'thir'
                  18 => 'thir'
                  19 => 'thir'

                }
  end

  def in_english
    factors[question] if question <= 9
  end
end