class Bst

  attr_reader :data, :left, :right

  def initialize(data)
    @data = Node.new(data).data
    @left = nil
    @right = nil
  end

  def insert(data)
    if data <= @data
      @left = Node.new(data)
    else
      @right = Node.new(data)
    end
  end
end

class Node

  attr_reader :data

  def initialize(data, next_node = nil)
    @data = data
    @next_node = nil
  end
end
