# RB101-RB109 Small Problems
# Easy 7 - Problem 9: Multiply All Pairs
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of every pair
of numbers that can be formed between the elements of the two Arrays.
The results should be sorted by increasing value.
You may assume that neither argument is an empty Array.

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

Further Exploration
What do you think? Did you go about solving this exercise differently?
What method did you end up using?

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
def multiply_all_pairs(arr1, arr2)
  multiplied_pairs = []
  arr1.each do |num1|
    arr2.each do |num2|
      multiplied_pairs << num1 * num2
    end
  end
  multiplied_pairs.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Further Exploration
# My solution is identical to the first solution in answer key, which I think
# may be easier to immediately understand than the refactored solution (though
# compact code is very nice to look at!).