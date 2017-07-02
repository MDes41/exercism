class BookKeeping
  VERSION = 2
end

class Clock

  def initialize(hour, minute)
    @total_minutes = TotalMinutes.new(hour, minute)
  end

  def to_s
    total_minutes.displayed
  end

  def self.at(hour, minute)
    new(hour, minute)
  end

  def +(minute) 
    total_minutes.add(minute)
    self
  end

  def ==(compare)
    to_s == compare.to_s
  end

  private
    attr_reader :total_minutes
end

class TotalMinutes
  attr_reader :total_minutes

  def initialize(hour, minute)
    @total_minutes = (hour * 60) + minute
  end

  def displayed
    "#{"%.2d" % ((total_minutes / 60) % 24)}:#{"%.2d" % (total_minutes % 60)}"
  end

  def add(minute)
    @total_minutes += minute
  end
end
