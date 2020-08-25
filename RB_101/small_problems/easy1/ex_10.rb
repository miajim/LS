# RB101-RB109 Small Problems
# Easy 1 - Problem 10: What's My Bonus?
# Tues. 08/25/20

# PROBLEM STATEMENT
# Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. 
# If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

# Examples:

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000
# The tests above should print true.

=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  two arguments: 1) positive integer (> 0), 2) boolean
Outputs
  output: 0 or positive integer
Rules/Implicit Requirements
  positive integers only as the 1st input, T/F only as 2nd input
  no default boolean parameter
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
The tests above should print true.

DATA STRUCTURE
Inputs
  integer, boolean
Rules

ALGORITHM
  define a method called calculate_bonus
  if boolean value is true ---> input int / 2
  if boolean value is false --> 0
=end

# CODE
def calculate_bonus(salary, bonus)
  bonus ? (salary/2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000