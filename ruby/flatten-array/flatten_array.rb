class FlattenArray
  VERSION = 1

  attr_reader :result

  def initialize
    @result     = []
  end

  def self.flatten(mixed_arr)
    new.flatten(mixed_arr)
  end

  def flatten(elements_to_process)
    elements_to_process.compact!
    current_element = elements_to_process[0]
    elements_to_process.shift if current_element        == []
    return result             if elements_to_process    == []
    if current_element.class    == Fixnum
      result << elements_to_process.shift
      flatten(elements_to_process)
    elsif current_element.class == Array
      flatten(elements_to_process.unshift(current_element.shift))
    end
  end
end

