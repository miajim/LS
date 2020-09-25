# RB101-RB109 Small Problems
# Easy 6 - Problem 1: Cute Angles
# Tues. 09/22/20

# PROBLEM STATEMENT
=begin
Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle in
degrees, minutes and seconds. You should use a degree symbol (°) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Examples:
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Note: your results may differ slightly depending on how you round values,
but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes
and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"

Further Exploration
Our solution returns the following results for inputs outside the range 0-360:
dms(400) == %(400°00'00")
dms(-40) == %(-40°00'00")
dms(-420) == %(-420°00'00")

Since degrees are normally restricted to the range 0-360,
can you modify the code so it returns a value in the appropriate range when the
input is less than 0 or greater than 360?
dms(400) == %(40°00'00")
dms(-40) == %(320°00'00")
dms(-420) == %(300°00'00")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - one floating point number between 0 and 360 degrees, inclusive
  Outputs
    - a single string that represents the degrees in DMS
Rules/Implicit Requirements
  - output should use two digit numbers for minutes and seconds
  - input can must be 0..360
  - must ensure that the input is also a floating point
  - quotes used for minutes, seconds must be escaped
Clarifying Questions
  - Can values greater than 360 degrees be passed an argument to the method?
  - Can negative values be passed as an argument to the method?
  - Does a check need to be performed to ensure that the input is between 0..360?
Mental Model (optional)
  - Convert a decimal degree to DMS and return as a string

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    - integer/float
  Rules
    - store in constants, escape quotes

ALGORITHM
  - (assuming the input is an integer or float between 0 and 360)
  - define constants (symbols for DMS)
  - convert the input to a float
  - whole number before the decimal is the degree
  - take the remainder (after the decimal) and multiply by 360
  - take this number and divide by 60 --> whole # = mins
  - take this remainder (after the decimal) and multiply by 60 = seconds
  - format the minutes and seconds to be two digit numbers --> strings
  - concatenate the string values for degree + degree sym. + mins + mins sym. + etc...
=end

# CODE
DEGREE = "\xC2\xB0"

MINS_PER_DEG = 60.0
SECS_PER_MIN = 60.0
SECS_PER_DEG = MINS_PER_DEG * SECS_PER_MIN
# round down the angle to the nearest whole number => degrees
# multiply angle by 3600, % 360 => total # of seconds
# total # of seconds / 60, round down to the nearest whole # => minutes
# total # of seconds % 60 ==> seconds


def dms(angle)
  angle = angle.to_f
  # option 1
  degrees = angle.floor()
  total_seconds = (angle * SECS_PER_DEG)  % SECS_PER_DEG
  minutes = (total_seconds / SECS_PER_MIN).floor()
  seconds = total_seconds % SECS_PER_MIN
  # option 2
  degrees = angle.floor()
  minutes = ((angle - degrees) * MINS_PER_DEG).floor()
  seconds = (((angle - degrees) * MINS_PER_DEG) - minutes) * SECS_PER_MIN
  # option 3
  degrees, minutes = angle.divmod(1)
  minutes, seconds = (minutes * MINS_PER_DEG).divmod(1)
  seconds *= SECS_PER_MIN
  # format output
  degrees.to_s + DEGREE + format("%02d\'%02d\"", minutes, seconds)
end

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further Exploration
REV = 360
def dms(angle)
  angle = angle.to_f

  # Note that this would also simply work with
  # angle %= REV
  # which will return the positive equivalent of a negative input angle
  if angle > REV
    angle = angle.remainder(REV)
  elsif angle.negative?
  angle = angle.remainder(REV) + REV
  end

  # option 3
  degrees, minutes = angle.divmod(1)
  minutes, seconds = (minutes * MINS_PER_DEG).divmod(1)
  seconds *= SECS_PER_MIN

  # format output
  degrees.to_s + DEGREE + format("%02d\'%02d\"", minutes, seconds)
end

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
