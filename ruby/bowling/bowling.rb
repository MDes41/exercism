class Game

  #if 10 pins are knocked down in the first ball the ball is reset to one
  #if less than 10 pins are knocked down in the first ball, second ball
  #if 3rd ball resset the ball back to 1st ball
  #if strike on first ball multiply the next two rolls
  #have to store the previous roll as a strike or a spare
  #callculate fist roll as a strike or spare and if else statement

  def initialize
    @pins = 0
    @ball = 1
    @frame = 1
    @current_frame = 1
    @current_roll = {}
    @previous_roll = nil
  end

  def roll(pins)
    if @frame == @current_frame
      @pins += pins
    else
    @pins += pins
    @pins += 10 if @previous_roll == 'strike'
    if pins == 10
      @previous_roll = 'strike'
      @current_frame += 1
    end
  end

  def score
    @pins
  end

end
