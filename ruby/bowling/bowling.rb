class Game

  attr_reader :final_score, :pins_array

  def initialize
    @pins_array = []
  end

  def roll(pins)
    raise 'Pins must have a value from 0 to 10' if !valid_pins(pins)
    @pins_array << pins
    # require "pry"; binding.pry
    raise 'Pin count exceeds pins on the lane' if !valid_frame(pins_array)
  end

  def valid_10th_frame
    if @pins_array.count > 18
      @pins_array[-1] + @pins
    end
  end

  def valid_frame(pins_array)
    require "pry"; binding.pry
    if @pins_array.count > 1
      if @pins_array[-1] != 10
        if @pins_array[-2] != 10
          return FALSE if @pins_array[-1] + @pins_array[-2] > 10
        end
      end
    end
    TRUE
  end

  def valid_pins(pins)
    (0..10).to_a.include?(pins)
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
    @pins_array = @pins_array.each_slice(2).to_a
    @pins_array[-1] << 0 if @pins_array[-1].count == 1
    raise 'Pin count exceeds pins on the lane' if check_pin_count(@pins_array)
    @pins_array
  end

  def check_pin_count(pins_array)
    x = FALSE
    pins_array.each do |pins|
      x = TRUE if pins[0] + pins[1] > 10
    end
    x
  end

  def score
    result = []
    frames_u = frames
    if frames_u.count > 1
      frames_u.each_with_index do |pins, index|
        if index < 9
          next_frame_pins = frames_u[index + 1]
          next_next_frame_pins = frames_u[index + 2]
          next_frame_pins = [0,0] if frames_u.count - index <= 1
          next_next_frame_pins = [0,0] if frames_u.count - index <= 2
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
        else
          result << pins[0] + pins[1]
        end
      end
    else
      result = @pins_array.flatten
    end
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
