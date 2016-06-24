class Game

  attr_reader :final_score, :pins_array

  def initialize
    @pins_array = []
  end

  def roll(pins)
    @pins_array << pins
  end

  def strike_indexes
    @pins_array.map.with_index do |pins, index|
      if pins == 10
        index
      end
    end.compact
  end

  def frames
    strike_indexes.reverse.each do |index|
      @pins_array.insert(index, 0)
    end
    @pins_array.each_slice(2).to_a
  end

  def score
    result = []
    frames_u = frames
    # result[0] = frames_u[0][0] + frames_u[0][1]
    if frames_u.count > 1
      frames_u.each_with_index do |pins, index|
        if strike(index, frames_u) && !double_strike(index, frames_u)
          result << result[index - 1] * 2
        elsif strike(index, frames_u) && double_strike(index, frame_u)
          result <<
        elsif spare(index, frames_u)
          result << pins[0] * 2 + pins[1]
        end
      end
    else
      result = @pins_array.flatten
    end
    require "pry"; binding.pry
    result.reduce(:+)
  end

  def double_strike(index, frames_u)
    

  def strike(index, frames_u)
    return FALSE if frames_u.count <= 1
    frames_u[index - 1][1] == 10
  end

  def spare(index, frames_u)
    return FALSE if frames_u.count <= 1
    frames_u[index - 1][0] + frames_u[index -1][1] == 10
  end
end
