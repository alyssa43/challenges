require 'date'

class Meetup
  SCHEDULE = { first: 0, second: 1, third: 2, fourth: 3, fifth: 4, last: -1 }

  def initialize(year, month)
    start_date = Date.civil(year, month, 1)
    end_date = Date.civil(year, month, -1)
    @range = (start_date..end_date)
  end

  def day(weekday, schedule)
    weekdays = @range.select(&:"#{weekday.downcase}?")

    if schedule.downcase == 'teenth'
      weekdays.find { |date| (13..19).include?(date.mday) }
    else
      weekdays[SCHEDULE[schedule.downcase.to_sym]]
    end
  end
end
