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
                  9 => 'nine',
                  10 => 'ten',
                  20 => 'twenty',
                  30 => 'thirty',
                  40 => 'fourty',
                  50 => 'fifty'

                }
  end

  def in_english
    return factors[question] if question <= 9
    factors[question - 10] + 'teen' if question > 9 && question < 20
  end
end