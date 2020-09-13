# RB101-RB109 Small Problems
# Easy 4 - Problem 6: Running Totals
# Fri. 09/11/20

# PROBLEM STATEMENT
=begin
Write a method that takes an Array of numbers, and returns an Array with the same
number of elements, and each element has the running total from the original Array.

Examples:

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

Further Exploration

Try solving this problem using Enumerable#each_with_object or
Enumerable#inject (note that Enumerable methods can be applied to Arrays).

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  array (elements = numbers, looks like integers specifically)
Outputs
  array (same number of elements as the input array, looks like a new array)
Rules/Implicit Requirements
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
Inputs
Rules

ALGORITHM

=end

# CODE
def running_total(input_arr)
  sum = 0
  input_arr.each_with_object([]) do |num, output_arr|
    sum += num
    output_arr << sum
  end
end

# Further Exploration
# with reduce/inject

def running_total(input_arr)
  output_arr = []
  input_arr.reduce(0) do |sum, num|
    output_arr << (sum + num)
    sum + num
  end
  output_arr
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

