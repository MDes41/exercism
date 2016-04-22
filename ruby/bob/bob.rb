
class Bob

  def hey(remark)
    if check_if_yelling?(remark) && check_for_letters?(remark)
      'Whoa, chill out!'
    elsif check_if_question?(remark)
      'Sure.'
    elsif remark.tr(" \t", '') == ''
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end

  def check_for_letters?(remark)
    valid_letters = ("a".."z").to_a
    remark.downcase.chars.any? do |letter|
      valid_letters.include?(letter)
    end
  end

  def check_if_yelling?(remark)
    remark.chars.all? do |letter|
      letter == letter.upcase
    end
  end

  def check_if_question?(remark)
    remark[-1] == '?'
  end

end
