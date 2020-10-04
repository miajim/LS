# RB101-RB109 Small Problems
# Easy 9 - Problem 4: Counting Up
# Sat. 09/26/20

# PROBLEM STATEMENT
=begin
Write a method that takes an integer argument, and returns an Array of all
integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

Further Exploration
Food for thought: what do you think sequence should return if the argument is
not greater than 0. For instance, what should you do if the argument is -1?
Can you alter your method to handle this case?
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

# def sequence(num)
#   (1..num).to_a
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

# # Further Exploration

# # Have negative numbers return an array from the num up to -1

# def sequence(num)
#   num.positive? ? (1..num).to_a : (num..-1).to_a
# end

# p sequence(-4) == [-4, -3, -2, -1]

# # OR Convert the negative input to a positive value

# def sequence(num)
#   (1..num.abs).to_a
# end

# p sequence(-4) == [1, 2, 3, 4]

# Further Exploration
def sequence_further(num)
  num > 0 ? [*1..num] : [*num..-1]
end

p sequence_further(4)