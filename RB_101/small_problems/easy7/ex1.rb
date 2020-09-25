# RB101-RB109 Small Problems
# Easy 7 - Problem 1: Combine Two Lists
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that combines two Arrays passed in as arguments, and returns a
new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

Further Exploration
Take a few minutes to read about Array#zip. #zip doesn't do the same thing as interleave,
but it is very close, and more flexible. In fact, interleave can be implemented
in terms of zip and one other method from the Array class. See if you can rewrite interleave to use zip.
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
def interleave(arr1, arr2)
  count = 0
  arr = []
  while count < arr1.length
    arr << arr1[count] << arr2[count]
    count += 1
  end
  arr
end

# LS Solution used Array#each_with_index instead of a count variable

# Further Exploration
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
