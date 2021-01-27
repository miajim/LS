# LS Ruby Challenge Problems (New)
# Medium - Problem 4: Meetups
# Tues. 01/26/2021

=begin

=end

=begin
# Notes
Inputs
  -
Outputs
  -
Rules/Req's
  - weekday can be: monday..sunday (case insensitive)
  - schedule can be: first, second, third, fourth, fifth, last, or teenth
    (case insensitive)
  -
Questions
  -
  -
Algorithm
  - define a class Meetup with #initialize and #day
  - define two array constants, WEEKDAY and SCHEDULE
    - index + 1 will correspond to numeric equivalent
  - #initialize(year, month)
  - #day(weekday, schedule)
    - initialize a count variable
    - determine the cwday of the weekday string
    - create a Date object that returns the day of the calendar week for the
      first of the month
      - e.g., Date.new(2013, 3, 1).cwday
    - find the first occurrence of the desired weekday
      - increment the first day by one until the cwday == desired weekday
    - add 7 * (n - 1) days to find the 2nd, 3rd, 4th, 5th occurrence
    - for last occurrence, save the previous date and check to see if the
      day of the week is correct & the month stays the same
    - for teenth occurrence, if 7 * (n - 1) == (13..19) then use the #
  - return a new date object with the year, month, and date
=end

# CODE
require 'date'

class Meetup
  WEEKDAY = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday',
             'Sunday']
  SCHEDULE = ['first', 'second', 'third', 'fourth', 'fifth', 'last', 'teenth']

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    target_weekday = WEEKDAY.index(weekday.capitalize) + 1
    schedule_idx = SCHEDULE.index(schedule.downcase)

    first_weekday = Date.new(year, month, 1)
    first_weekday += 1 until first_weekday.cwday == target_weekday

    target_date = find_date(first_weekday, schedule_idx)

    target_date.year == year && target_date.mon == month ? target_date : nil
  end

  private

  attr_reader :year, :month

  def find_date(weekday_num, schedule_num)
    if (0..4).include?(schedule_num)
      schedule_num.times { |_| weekday_num += 7 }
    elsif schedule_num == 5
      weekday_num += 7 while weekday_num.mon == month
      weekday_num -= 7
    else
      weekday_num += 7 until (13..19).include?(weekday_num.day)
    end
    weekday_num
  end
end

# p Meetup.new(2016, 3).day('Monday', 'last')
