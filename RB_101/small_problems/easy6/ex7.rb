# RB101-RB109 Small Problems
# Easy 6 - Problem 7: Halvsies
# Thurs. 09/24/20

# PROBLEM STATEMENT
=begin
Write a method that takes an Array as an argument, and returns two Arrays
(as a pair of nested Arrays) that contain the first half and second half of the
original Array, respectively. If the original array contains an odd number of
elements, the middle element should be placed in the first half Array.

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

Further Exploration
Can you explain why our solution divides array.size by 2.0 instead of just 2?

This is but one way to solve this problem. What solution did you end up with? Was it similar or entirely different?
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    -
  Outputs
    -
Rules/Implicit Requirements
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
  - determine the number of elements to go in the first half of the array
=end

def halvsies(arr)
  mid = (arr.length / 2.0).ceil
  [arr[0...mid], arr[mid...arr.length]] # could also use Array#slice
end

# CODE
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# Further Exploration
# The array length has to be divided by a float in order to account for the
# result of an odd dividend, which is then rounded up to the nearest integer.
# My answer was almost identical to the provided solution.