class FlattenArray
  VERSION = 1
  attr_reader :result

  def initialize
    @result = []
  end

  def self.flatten(mixed_arr)
    new.flatten(mixed_arr)
  end


  def flatten(item)
    item.is_a?(Array) ? item.each { |item| flatten(item) } : result.push(item)
    return result.compact
  end
end
