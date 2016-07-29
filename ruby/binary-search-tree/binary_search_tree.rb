


class Bst

  attr_reader :data
  attr_accessor :right, :left

  def initialize(data)
    @data = data
  end

  def insert(value)
    case data <=> value
    when 1 then insert_left(value)
    when -1 then insert_right(value)
    when 0 then insert_left(value)
    end
  end

  def insert_left(value)
    if left
      left.insert(value)
    else
      self.left = Bst.new(value)
    end
  end

  def insert_right(value)
    if right
      right.insert(value)
    else
      self.right = Bst.new(value)
    end
  end

  def each(&block)
    return to_enum unless block
    left.each(&block) if left
    block.call(data)
    right.each(&block) if right
  end

  VERSION = 1
end
