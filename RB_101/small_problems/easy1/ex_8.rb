# RB101-RB109 Small Problems
# Easy 1 - Problem 8: Array Average
# Tues. 08/25/20

# PROBLEM STATEMENT
# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array.
# The array will never be empty and the numbers will always be positive integers. 
# Your result should also be an integer.

# Examples:

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40
# The tests above should print true.

=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  one argument, array w/ integers
Outputs
  one integer that is the average of all the integers in the array
Rules/Implicit Requirements
  array will never be empty (at least one integer)
  all numbers in the array will always be positive integers (i.e., > 0)
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES
  puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
  puts average([1, 5, 87, 45, 8, 8]) == 25
  puts average([9, 47, 23, 95, 16, 52]) == 40
  The tests above should print true.

DATA STRUCTURE
Inputs
  1D array
Rules

ALGORITHM
  define a method called average that takes one arg as an array
  find the sum of all the values in the array
  divide the sum of all the values by the length (# of values) in the array
  report back this number
=end

# CODE
def average(ary)
  (ary.sum) / (ary.size)  # Could use Array#count or Array#length instead of Array#size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# FURTHER EXPLORATION
def average(ary)
  (ary.sum) / (ary.size.to_f)  
end

puts average([1, 6]) == 3.5  # returns true