class Array

  def keep(&block)
    result = []
    self.each { |i| result << i if block.call(i) }
    result
  end

  def discard(&block)
    result = []
    self.each { |i| result << i if !block.call(i) }
    result
  end

end
