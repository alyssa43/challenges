# A clock that adds or subtracts time
class Clock
  def initialize(hour, minute=0)
    @hour = hour % 24
    @minute = minute % 60
  end

  def self.at(hour, minute=0)
    Clock.new(hour, minute)
  end

  def +(mins)
    total_mins = total_minutes(@hour, @minute + mins)
    hr, min = minutes_to_hours(total_mins)
    Clock.new(hr, min)
  end

  def -(mins)
    total_mins = total_minutes(@hour, @minute - mins)
    hr, min = minutes_to_hours(total_mins)
    Clock.new(hr, min)
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    "#{format_hour}:#{format_minutes}"
  end

  private

  def total_minutes(hours, minutes)
    (hours * 60) + minutes
  end

  def minutes_to_hours(mins)
    hour = (mins / 60) % 24
    hour += 24 if mins < 0
    minute = mins % 60
    [hour, minute]
  end

  def format_hour
    @hour < 10 ? "0#{@hour}" : @hour
  end

  def format_minutes
    @minute < 10 ? "0#{@minute}" : @minute
  end
end
