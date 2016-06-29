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
      @pins_array.insert(index + 1, 0)
    end
    @pins_array.each_slice(2).to_a
  end

  def score
    result = []
    frames_u = frames
    # require "pry"; binding.pry
    if frames_u.count > 1
      frames_u.each_with_index do |pins, index|
        next_frame_pins = frames_u[index + 1]
        next_next_frame_pins = frames_u[index + 2]
        next_frame_pins = [0,0] if frames_u.count - index <= 1
        next_next_frame_pins = [0,0] if frames_u.count - index <= 2
        # require "pry"; binding.pry
        if strike(pins) && !strike(next_frame_pins)
          result << pins[0] + add_one_frame(next_frame_pins)
        elsif strike(pins) && strike(next_frame_pins)
          result << pins[0] + add_one_frame(next_frame_pins) + add_two_frames(next_next_frame_pins)
        elsif strike(pins) && spare(next_frame_pins)
          result << pins[0] + add_first_ball_next_frame(next_frame_pins)
        elsif spare(pins)
          result << pins[0] + pins[1] + add_first_ball_next_frame(next_frame_pins)
        else
          result << pins[0] + pins[1]
        end
      end
    else
      result = @pins_array.flatten
    end
    # require "pry"; binding.pry
    result.reduce(:+)
  end

  def add_first_ball_next_frame(pins)
    pins[0]
  end

  def add_one_frame(pins)
    pins[0] + pins[1]
  end

  def add_two_frames(pins)
    pins[0] + pins[1]
  end

  def strike(pins)
    pins[0] == 10
  end

  def spare(pins)
    pins[0] + pins[1] == 10
  end
end
