# RB101-RB109 Small Problems
# Easy 4 - Problem 4: Leap Years (Part 2)
# Fri. 09/11/20

# PROBLEM STATEMENT
=begin
A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year.
Prior to 1752, the Julian Calendar was used. Under the Julian Calendar,
leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to
determine leap years both before and after 1752.

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

Further Exploration
Find a web page that talks about leap years or the different calendar systems,
and talk about the interesting information you learned.
For instance, how was the change from the Julian calendar to the Gregorian calendar
handled in your ancestral lands? Do they even use these calendar systems?
If you live someplace that doesn't use the Gregorian calendar,
tell us about your calendar system.

The change from the Julian calendar to the Gregorian calendar in the US occurred
in 1752, 170 years after it was first introduced. This switch was handled by
excluding 11 days from the month of September in 1752. I was always under the
impression that leap years were strictly every 4 years (which was true for the
Julian calendar system), however it appears to be more "nuanced" than this,
because of the amount of time it takes for the Earth to rotate around the Sun
(exactly 365 days + 6 hrs would result in perfect leap years, however the actual
amount is just under 6 hrs). Leap years basically exist to ensure that the
calendar year remains in-sync with the seasons. 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  - integer
Outputs
  - boolean

Rules/Implicit Requirements
- input is greater than zero
LEAP YEAR IF:
(year % 4 == 0) && (year % 100 != 0)
(year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)
OTHERWISE:
not a leap year

Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
  - integer

  Rules

ALGORITHM

=end

# CODE
# Using the simplified code from the LS Solution to the previous exercise:
def leap_year?(year)
  if year > 1752
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  else
    (year % 4) == 0
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# Further Exploration


