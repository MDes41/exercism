class Game

  #if 10 pins are knocked down in the first ball the ball is reset to one
  #if less than 10 pins are knocked down in the first ball, second ball
  #if 3rd ball resset the ball back to 1st ball
  #if strike on first ball multiply the next two rolls
  #have to store the previous roll as a strike or a spare
  #callculate fist roll as a strike or spare and if else statement

  def initialize
    @pins_score = []
    @frame = 1
    @ball = 1
    @pins_hit = []
  end

  def roll(pins)

    @pins_hit << pins

    if @pins.join.length == 1
      if @pins_hit[@frame - 2] == 10
        @previous_frame = 'strike'
      end
    end

    if @pins.join.length >= 2
      # require "pry"; binding.pry
      if @pins_hit[@frame - 2] == 10
        @previous_frame = 'strike'
      elsif @pins_hit[@frame - 2] + @pins_hit[@frame - 3] == 10 && @pins.count >= 2
        # require "pry"; binding.pry
        @previous_frame = 'spare'
      else
        @previous_frame = nil
      end
    end

    if pins == 10 && @previous_frame == nil
      # require "pry"; binding.pry
      @pins << pins
      @ball = 1
      @frame += 1
    elsif pins == 10 && @previous_frame == 'strike'
      # require "pry"; binding.pry
      # require "pry"; binding.pry
      @pins << pins * 2
      @extra_pins << @pins_hit[@frame - 2] * 2
      @ball = 1
      @frame += 1
    elsif @ball == 1 && @previous_frame == 'strike'
      # require "pry"; binding.pry
      @pins << pins * 2
      @ball += 1
    elsif @ball == 2 && @previous_frame == 'strike'
      # require "pry"; binding.pry
      @pins << pins * 2
      @ball += 1
    elsif @ball == 1 && @previous_frame == 'spare'
      # require "pry"; binding.pry
      @pins << pins * 2
      @ball += 1
    elsif @ball == 3
      # require "pry"; binding.pry
      @ball = 1
      @pins_hit.pop
      self.roll(pins)
    else
      # require "pry"; binding.pry
      @pins << pins
      @ball += 1
      @frame += 0.5
    end
  end

  def score
    require "pry"; binding.pry
    @pins.reduce(:+)
  end

end
