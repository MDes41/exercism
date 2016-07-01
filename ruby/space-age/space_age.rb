class SpaceAge

  def initialize(seconds)
    @seconds = seconds
    @op = {
            Earth: 31557600.00,
            Mercury: 0.2408467,
            Venus: 0.61519726,
            Mars: 1.8808158,
            Jupiter: 11.862615,
            Saturn: 29.447498,
            Uranus: 84.016846,
            Neptune: 164.79132
          }
  end

  def seconds
    @seconds
  end

  def on_earth
    result = @seconds / @op[:Earth]
    result.round(2)
  end

  def on_mercury
    result = @seconds / ( @op[:Earth] * @op[:Mercury] )
    result.round(2)
  end

  def on_venus
    result = @seconds / ( @op[:Earth] * @op[:Venus] )
    result.round(2)
  end

  def on_mars
    result = @seconds / ( @op[:Earth] * @op[:Mars] )
    result.round(2)
  end

  def on_jupiter
    result = @seconds / ( @op[:Earth] * @op[:Jupiter] )
    result.round(2)
  end

  def on_saturn
    result = @seconds / ( @op[:Earth] * @op[:Saturn] )
    result.round(2)
  end

  def on_uranus
    result = @seconds / ( @op[:Earth] * @op[:Uranus] )
    result.round(2)
  end

  def on_neptune
    result = @seconds / ( @op[:Earth] * @op[:Neptune] )
    result.round(2)
  end

end
