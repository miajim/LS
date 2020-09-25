# RB101-RB109 Small Problems
# Easy 7 - Problem 8: Multiply Lists
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of each pair
of numbers from the arguments that have the same index. You may assume that
the arguments contain the same number of elements.

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

Further Exploration
The Array#zip method can be used to produce an extremely compact solution to
this method. Read the documentation for zip, and see if you can come up with a
one line solution (not counting the def and end lines).
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
  -
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
  -
=end

# CODE
def multiply_list(arr1, arr2)
  product_arr = []
  arr1.each_with_index { |elem, i| product_arr << (elem * arr2[i]) }
  product_arr
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further Exploration
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |subarr| subarr.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]