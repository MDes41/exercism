class Clock
  attr_reader :total_minutes

  def initialize(hour, minute)
    @total_minutes = (hour * 60) + minute
  end

  def to_s
    "#{"%.2d" % ((@total_minutes / 60) % 24)}:#{"%.2d" % (@total_minutes % 60)}"
  end

  def self.at(hour, minute)
    new(hour, minute)
  end

end
