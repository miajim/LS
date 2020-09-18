# RB101-RB109 Small Problems
# Easy 5 - Problem 2: After Midnight (Part 1)
# Tues. 09/15/20

# PROBLEM STATEMENT
=begin
The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the
time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

Disregard Daylight Savings and Standard Time and other complications.

Further Exploration

How would you approach this problem if you were allowed to use ruby's Date and Time classes?
Suppose you also needed to consider the day of week? (Assume that delta_minutes is the number of minutes before or after midnight between Saturday and Sunday;
in such a method, a delta_minutes value of -4231 would need to produce a return value of Thursday 01:29.)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  positive or negative integer represented as a string (# of minutes)
Outputs
  string (hh:mm)
Rules/Implicit Requirements
  If the number of minutes is positive, the time is after midnight.
  If the number of minutes is negative, the time is before midnight.
  The number of minutes input can exceed one day (i.e., +/- 1440 mins)
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES
  time_of_day(0) == "00:00"
  time_of_day(-3) == "23:57"
  time_of_day(35) == "00:35"
  time_of_day(-1437) == "00:03"
  time_of_day(3000) == "02:00"
  time_of_day(800) == "13:20"
  time_of_day(-4231) == "01:29"

DATA STRUCTURE
Inputs
Rules

ALGORITHM
# Find the absolute value of the input
# Find the quotient and remainder of the input divided by 1440 min/day
# Take the remainder and mutiply by 24 hrs/day
# if input was a positive number:
  # Take the whole number and convert to a 2 digit (hour) string, multiply the remainder by 60 min/hr
  # Express the result as a 2 digit (minute) string
# if input was a negative number:
  # Subtract the hour value from 24, take the whole number and convert to 2 digit (hour) string
  # multiply the decimal portion by 60 min/hr and express as a 2 digit (minute) string
# Join the Hour string and the Minute string by a colon
# Do not output the result
=end

MINS_PER_DAY = 1440
HOURS_PER_DAY = 24
MINS_PER_HOUR = 60

# CODE
def format_time(time_int)
  if time_int < 10
    "0" + time_int.to_s
  else
    time_int.to_s
  end
end

def time_of_day(input_mins)
  total_mins = input_mins.abs()
  if total_mins >= 1440
    _, total_mins = total_mins.divmod(MINS_PER_DAY)
  end
  (total_mins = MINS_PER_DAY - total_mins) if input_mins.negative?
  hours = total_mins / MINS_PER_HOUR
  mins = total_mins - hours * MINS_PER_HOUR
  format_time(hours) + ":" + format_time(mins)
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# LS Solution

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINS_PER_DAY
  hours, minutes = delta_minutes.divmod(MINS_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

# Further Exploration
  # days = delta_minutes.abs() / MINS_PER_DAY
  # (days = 7 - (days + 1)) if delta_minutes.negative?

DAYS_PER_WEEK = 7
SECONDS_PER_MIN = 60

require 'date'
require 'time'

def time_of_day(delta_minutes)
  days, delta_minutes =  delta_minutes.divmod(MINS_PER_DAY)
  _, days = days.divmod(DAYS_PER_WEEK)
  hours, minutes = delta_minutes.divmod(MINS_PER_HOUR)
  # Date::DAYNAMES[days] + " " + format('%02d:%02d', hours, minutes)
  t = Time.new(2020, 9, 13 + days, hours, minutes)
  t.strftime("%A %R")
end

p time_of_day(3000) # == time_of_day(13080)
p time_of_day(-4231) # == time_of_day(-14311)

# Refactored Further Exploration
def time_of_day(delta_minutes)
  sunday = Time.new(2020, 9, 13)
  day_and_time = sunday + delta_minutes * SECONDS_PER_MIN
  day_and_time = day_and_time.strftime("%A %R")
end

p time_of_day(0) == "Sunday 00:00"
p time_of_day(-3) == "Saturday 23:57"
p time_of_day(35) == "Sunday 00:35"
p time_of_day(-1437) == "Saturday 00:03"
p time_of_day(3000) == "Tuesday 02:00"
p time_of_day(800) == "Sunday 13:20"
p time_of_day(-4231) == "Thursday 01:29"