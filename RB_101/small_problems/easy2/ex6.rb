# RB101-RB109 Small Problems
# Easy 2 - Problem 6: Odd Numbers
# Fri. 09/04/20

# PROBLEM STATEMENT
=begin
Print all odd numbers from 1 to 99, inclusive.
All numbers should be printed on separate lines.

Repeat this exercise with a technique different from the one you just used,
and different from the solution shown above.
You may want to explore the use Integer#upto or Array#select methods,
or maybe use Integer#odd?

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
(1..99).to_a.each {|num| puts num if num.odd?}

# LS Solution Notes


# Further Exploration

puts (1..99).to_a.select {|num| num.odd?}

1.upto(99) {|num| puts num if num.odd?}