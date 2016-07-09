class Bst

  attr_reader :data, :right

  def initialize(data)
    @top_node = Node.new(data)
    @current_node = @top_node
    @data = @current_node.data
    record_all_data
  end

  def record_all_data
    
  end

  def insert(data)
    find_last_node(data)
    @current_node = @top_node
  end

  def find_last_node(data)
    if data <= @current_node.data
      left_node(data)
    else
      right_node(data)
    end
  end

  def left_node(data)
    if @current_node.left == nil
      @current_node.left = Node.new(data)
    else
      @current_node = @current_node.left
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

  def left
    @current_node = @top_node
    @current_node = @current_node.left
  end

  def right
    @current_node = @top_node
    @current_node = @current_node.right
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
