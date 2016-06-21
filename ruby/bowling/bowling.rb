class Game

  #if 10 pins are knocked down in the first ball the ball is reset to one
  #if less than 10 pins are knocked down in the first ball, second ball
  #if 3rd ball resset the ball back to 1st ball
  #if strike on first ball multiply the next two rolls
  #have to store the previous roll as a strike or a spare
  #callculate fist roll as a strike or spare and if else statement

  def initialize
    @pins = []
    @frame = 1
  end

  def roll(pins)
    if pins == 10
      @previous_frame = 'strike'
      @pins += pins
      @frame += 1
      @ball = 1
    elsif @ball == 2 && @pins[-1] + pins == 10
      @frame += 1
      @pins += pins
      @previous_frame = 'spare'
    elsif @ball == 1 && @previous_frame == 'strike'
      @pins += pins * 2
      @ball += 1
    elsif @ball == 2 & @previous_frame == 'strike'
      @pins += pins * 2
    elsif @ball == 3
      @frame += 1
      self.roll(pins)
      @

    @pins << pins
  end

  def score
    @pins.map do |pin|
      if pin < 10
        @@frame => pin
        @frame += 1
      else
        @total[@frame] += pin
      end
    end.reduce(:+)
  end


  end

end
