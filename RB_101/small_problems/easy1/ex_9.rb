# RB101-RB109 Small Problems
# Easy 1 - Problem 9: Sum of Digits
# Tues. 08/25/20

# PROBLEM STATEMENT
# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# Examples:

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45
# The tests above should print true.

# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  one arg, positive int
Outputs
  positive int (sum of input digits)
Rules/Implicit Requirements
  there will be no spaces or special characters present (Ruby ignores underscores)
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES
  puts sum(23) == 5
  puts sum(496) == 19
  puts sum(123_456_789) == 45
  The tests above should print true.

DATA STRUCTURE
Inputs
  integer
Rules

ALGORITHM
  define a method called sum
  turn the integer input to a string
  take each character, turn it back to an integer
  add the integer to a cumulative sum variable
  
  ***without a loop***
  turn the input into an array
  split each character s.t. each is an individual value in the array
  convert string back to ints
  sum the values in the array
=end

# CODE
def sum(num)
  num.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
 