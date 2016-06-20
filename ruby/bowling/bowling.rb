class Game

  #if 10 pins are knocked down in the first ball the ball is reset to one
  #if less than 10 pins are knocked down in the first ball, second ball
  #if 3rd ball resset the ball back to 1st ball
  #if strike on first ball multiply the next two rolls
  #have to store the previous roll as a strike or a spare
  #callculate fist roll as a strike or spare and if else statement

  def initialize
    @pins = 0
    @ball = 0
    @current_roll = {}
    @previous_roll = {}
  end

  def roll(pins)
    #if current_roll
      #if previous_roll
        #if strike
        
        #or
        #if spare

      or
      add pins




    @ball = 1 if @ball == 0 || @ball == 3

    if @ball == 1 && pins == 10
      @pins += pins
    @ball += 1 if pins == 10
    @ball += 1
  end

  def score
    @pins
  end

end
