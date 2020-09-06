# RB101-RB109 Small Problems
# Easy 2 - Problem 7: Even Numbers
# Fri. 09/04/20

# PROBLEM STATEMENT
=begin
Print the even numbers from 1 to 99, inclusive.
All numbers should be printed on separate lines.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
Outputs
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
(1..99).to_a.each {|num| puts num if num.even?}

# LS Solution Notes