# RB101-RB109 Small Problems
# Easy 5 - Problem 3: After Midnight (Part 2)
# Tues. 09/15/20

# PROBLEM STATEMENT
=begin
As seen in the previous exercise, the time of day can be represented
as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format,
and return the number of minutes before and after midnight, respectively.
Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

Assuming all inputs are valid and no need to write validity checks

algo for after_midnight
- split the string by ":"
- convert each string value in array to an integer value
- guard clause: if hours == 24 --> set hours = 0
- Take the hours and multiply by 60 mins/hr
- Add to the minutes and return the sum

algo for before_midnight
- subtract the return value from after_midnight from 1440 mins/day and return, unless
- the return value is zero

Disregard Daylight Savings and Standard Time and other complications.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs

Outputs

Rules/Implicit Requirements

Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
Inputs
Rules

ALGORITHM

=end

MINS_PER_DAY = 1440
MINS_PER_HOUR = 60
HOURS_PER_DAY = 24

# algo for after_midnight
# - split the string by ":"
# - convert each string value in array to an integer value
# - guard clause: if hours == 24 --> set hours = 0
# - Take the hours and multiply by 60 mins/hr
# - Add to the minutes and return the sum

# algo for before_midnight
# - subtract the return value from after_midnight from 1440 mins/day and return, unless
# - the return value is zero

def after_midnight(str)
  hours, mins = str.split(":").map(&:to_i)
  hours = 0 if hours == HOURS_PER_DAY
  hours * MINS_PER_HOUR + mins # LS Solution peforms a mod division on this value (% 1440) to deal with 24:00
end

def before_midnight(str)
  return (MINS_PER_DAY - after_midnight(str)) unless after_midnight(str) == 0
  0
end

# Further Exploration
require 'time'

def after_midnight(str)
  hours = Time.parse(str).hour
  minutes = Time.parse(str).min
  hours * MINS_PER_HOUR + minutes
end

def before_midnight(str)
  return (MINS_PER_DAY - after_midnight(str)) unless after_midnight(str) == 0
  0
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0