# RB101-RB109 Small Problems
# Easy 6 - Problem 6: Combining Arrays
# Thurs. 09/24/20

# PROBLEM STATEMENT
=begin
Write a method that takes two Arrays as arguments, and returns an Array that
contains all of the values from the argument Arrays. There should be no
duplication of values in the returned Array, even if there are duplicates in the
original Arrays.

Further Exploration
How did you go about solving this one? Using this method for set union is
convenient, but what if we didn't have it? There are certainly a few other ways
to go about solving this exercise.

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
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
  -
=end

# CODE

def merge(arr1, arr2)
    (arr1 << arr2).flatten.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


# Further exploration
# other ways of solving
def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

def merge(arr1, arr2)
  arr1.union(arr2)
end