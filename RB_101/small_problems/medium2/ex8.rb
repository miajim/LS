# RB101-RB109 Small Problems
# Medium 2 - Problem 8: Next Featured Number Higher than a Given Value
# Fri. 10/30/20

# PROBLEM STATEMENT
=begin
A featured number (something unique to this exercise) is an odd number that is
a multiple of 7, and whose digits occur exactly once each. So, for example, 49
is a featured number, but 98 is not (it is not odd), 97 is not
(it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next
featured number that is greater than the argument. Issue an error message
if there is no next featured number.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - one integer, representing the "starting" point
  Outputs
    - one integer, representing the next "featured number"
Rules/Implicit Requirements
  - a featured number is a multiple of 7 AND odd AND has unique digits
  - we must return the next consecutive featured number using the input number
    as a starting point
  -
Clarifying Questions
  -
Mental Model (optional)
  -

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    -
  Rules
    -

ALGORITHM
  - take the input number and divide it by 7
  - use the result (quotient) plus 1 to calculate the next multiple of 7
    that is greater than the input number
  - check to see if this number meets the other 2 requirements of a featured
    number
  - guard clause: if the current number is more than 10 digits long, then it is
    impossible for there to be a featured number because the digits will have to
    repeat
      - convert the current num to a string, find the length of the string,
        if it exceeds 10, return an error message
    - i.e., is the number odd AND does it have unique digits
    - for unique digits, OPTION 1:
      - convert current num to a digits array
      - create an array of unique values
      - if the length of the digits array is the same length as the array of
        unique values, then we know that no digits repeat themselves
  - break out of the loop and return the first number that meets all 3 requirements
=end


def featured(num)
  start_num = (num / 7) + 1
  loop do
    current_num = 7 * start_num
    return "There is no possible number that fulfills those requirements." if current_num.to_s.size > 10
    return current_num if current_num.odd? && unique?(current_num)
    start_num += 1
  end
end

def unique?(num)
  (0..9).each { |digit| return false if num.to_s.count(digit.to_s) > 1 }
  true
end

# p unique?(12) == true
# p unique?(997) == false
# p unique?(11001) == false

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements