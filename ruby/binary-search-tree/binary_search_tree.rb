class Bst

  attr_reader :data, :right

  def initialize(data)
    @top_node = Node.new(data)
    @current_node = @top_node.dup
    @data = @top_node.data
  end

  def insert(data)
    find_last_node(data)
  end

  def find_last_node(data)
    if data <= @current_node.data
      left_node(data)
    else
      right_node(data)
    end
  end

  def left
    @current_node = @current_node.left
  end

  def right
    @current_node = @current_node.right
  end

  def left_node(data)
    if @current_node.left == nil
      @current_node.left = Node.new(data)
    else
      # require "pry"; binding.pry
      @current_node = @current_node.left
      # require "pry"; binding.pry
      find_last_node(data)
    end
  end

  def right_node(data)
    if @current_node.right == nil
      @current_node.right = Node.new(data)
    else
      @current_node = @current_node.right
      find_last_node(data)
    end
  end
end

class Node

  attr_reader :data
  attr_accessor :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @right = nil
    @left = nil
  end
end
