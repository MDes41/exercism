class BookKeeping
  VERSION = 1
end

class Game

  attr_reader :pins_array

  def initialize
    @pins_array = []
  end

  def roll(pins)
    raise 'Pins must have a value from 0 to 10' if !valid_pins(pins)
    if @pins_array == [] && pins != 10
      @pins_array << pins
    elsif pins == 10
      @pins_array << [ pins, 0 ]
    elsif @pins_array[-1].class == Array
      @pins_array << pins
    elsif @pins_array[-1].class == Fixnum
      @pins_array[-1] = [ @pins_array[-1], pins ]
    end
    @pins_array[-1] = [@pins_array[-1], 0] if @pins_array.count > 10 && @pins_array[-1].class == Fixnum && @pins_array[-2][0] != 10
    raise 'Pin count exceeds pins on the lane' if !valid_frame(pins_array)
  end

  def valid_frame(pins_array)
    pins_array[-1][0] + pins_array[-1][1] <= 10
  end

  def valid_pins(pins)
    (0..10).to_a.include?(pins)
  end

  def score
    result = []
    frames_u = @pins_array
    require "pry"; binding.pry
    raise 'Score cannot be taken until the end of the game' if frames_u[-1] == Fixnum
    raise 'Score cannot be taken until the end of the game' if frames_u.flatten.count < 20
    raise 'Score cannot be taken until the end of the game' if frames_u.flatten.count < 22 && frames_u[-1][0] == 10
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
