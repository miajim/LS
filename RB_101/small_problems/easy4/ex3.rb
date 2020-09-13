# RB101-RB109 Small Problems
# Easy 4 - Problem 3: Leap Years (Part 1)
# Fri. 09/11/20

# PROBLEM STATEMENT
=begin
In the modern era under the Gregorian Calendar, leap years occur in every year
that is evenly divisible by 4, unless the year is also divisible by 100.
If the year is evenly divisible by 100, then it is not a leap year unless
the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0.
Write a method that takes any year greater than 0 as input, and returns true
if the year is a leap year, or false if it is not a leap year.

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

Further Exploration
The order in which you perform tests for a leap year calculation is important. For what years will leap_year? fail if you rewrite it as:

def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

Can you rewrite leap_year? to perform its tests in the opposite order of the above solution?
That is, test whether the year is divisible by 4 first, then, if necessary,
test whether it is divisible by 100, and finally, if necessary, test whether
it is divisible by 400. Is this solution simpler or more complex than the original solution?

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
# def leap_year?(year)
#   if (year % 4 == 0) && (year % 100 != 0)
#     true
#   elsif (year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)
#     true
#   else
#     false
#   end
# end

def leap_year?(year)
  if (year % 4) == 0
    if (year % 100) == 0
      if (year % 400) == 0
        true
      else
        false
      end
    else
      true
    end
  else
    false
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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

=begin
# Further Exploration
Years that are divisible by 400 are also divisible by 100, but this portion of the
if statement will not execute for those values and thus will return false.
This includes years like 2400, 240000, 2000, 400.
My second definition for the leap_year? method demonstrates what this would look like.
It is considerably harder to follow than the LS solutions.
=end

# LS Solutions
# The key here is to recognize that if the year is divisible by 400, then it's
# also divisible by 4 and 100, since they are factors of 400.

# Option 1
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# Option 2
def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

