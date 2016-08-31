require 'time'
class Clock
  def self.at(hour, minute)
    time = Time.strptime("#{hour}:#{minute}", "%I:%M")
    require "pry"; binding.pry
    "#{"%.2d" % time.hour}:#{"%.2d" % time.min}"
  end
end
