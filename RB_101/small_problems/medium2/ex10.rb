# RB101-RB109 Small Problems
# Medium 2 - Problem 10: Sum Square - Square Sum
# Sat. 10/31/20

# PROBLEM STATEMENT
=begin
Write a method that computes the difference between the square of the sum of
the first n positive integers and the sum of the squares of the first n
positive integers.

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - one integer (assume > 0, based on conditions and test cases)
  Outputs
    - one integer, represents the sum square minus the square sum
Rules/Implicit Requirements
  - find the sum of the first n integers 1..n, square the sum
  - find the square of each integer from 1..n, sum each square
  - subtract the sum of each square from the square of the sum
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
  - generate a range (or an array) from numbers 1..n
  - compute the sum of all the numbers in the array and square it
  - iterate through the numbers squaring and then summing each square
  - subtract the 2nd value from the 1st value and return
=end

def sum_square_difference(n)
  (1..n).sum ** 2 - (1..n).reduce(0) { |sum, num| sum + num ** 2 }
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
