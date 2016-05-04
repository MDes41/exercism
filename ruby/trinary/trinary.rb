class Trinary

  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if not_all_numbers?
    @number.chars.reverse.map.with_index do |num, index|
      num.to_i * (3 ** index)
    end.reduce(&:+)
  end

  def not_all_numbers?
    @number.tr("0-9", '').length != 0
  end

end
