require 'time'
class Clock

  def self.to_s
    # self.new
    # time = Time.strptime("#{self / 60}:#{self % 60}", "%H:%M")
    # "#{"%.2d" % time.hour}:#{"%.2d" % time.min}"
    # 'name'
  end

  def self.at(hour, minute)
    hours_of_minutes = minute / 60
    hour = (hours_of_minutes + hour) % 24
    minute = minute % 60
    @total_minutes = (hour * 60) + minute
    @total_minutes
  end


end
