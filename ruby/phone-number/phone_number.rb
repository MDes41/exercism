class PhoneNumber

  def initialize(number)
    @number = number
  end

  def number
    if valid_number?
      result = clean_number
      result[0] = '' if clean_number.length == 11
      result
    else
      "0000000000"
    end
  end

  def clean_number
    @number.tr("^1-90a-zA-Z", '')
  end

  def all_numbers?
    clean_number.chars.all? { |digit| ("0".."9").to_a.include?(digit) }
  end

  def valid_length?
    clean_number.length == 10 || clean_number.length == 11
  end

  def valid_first?
    result = true
    result = false if clean_number.length == 11 && clean_number[0] != "1"
    result
  end

  def valid_number?
    all_numbers? && valid_length? && valid_first?
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end

end
