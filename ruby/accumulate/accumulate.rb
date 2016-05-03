class Array
  def accumulate(&block)
    result = []
    self.each do |i|
      result << block.call(i)
    end
    result
  end
end
