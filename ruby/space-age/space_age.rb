class SpaceAge

  def initialize(seconds)
    @seconds = seconds
  end

  def seconds
    @seconds
  end

  def on_earth
    @earth = @seconds / 31557600.00
    result = @earth
    result.round(2)
  end

  def on_mercury
    result = @seconds / ( 31557600.00 * 0.2408467 )
    result.round(2)
  end

  def on_venus
    result = @seconds / ( 31557600.00 * 0.61519726 )
    result.round(2)
  end

end
