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
        if strike(pins) && !strike(index + 1,pins)
          result << pins[1] + add_one_frame(index, pins)
        elsif strike(index, pins) && strike(index + 1, pins)
          result << pins[1] + add_two_frames(index, pins)
        elsif strike(index, pins) && spare(index, pins)
          result << pins[0] * 2 + pins[1]
        else
          result << pins[0]
        end
      end
    else
      result = @pins_array.flatten
    end
    result.reduce(:+)
  end

  def add_one_frame(index, pins)
    pins[index + 1][0] + pins[index + 1][1]
  end

  def add_two_frames(index, pins)
    add_one_frame(index, pins) + pins[index + 2][0] + pins[index + 2][1]
  end

  def strike(index, pins)
    pins[index][1] == 10
  end

  def spare(index, pins)
    pins[index][0] + pins[index][1] == 10
  end
end
