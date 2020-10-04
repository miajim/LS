# RB101-RB109 Small Problems
# Easy 9 - Problem 7: Name Swapping
# Sun. 10/04/20

# PROBLEM STATEMENT
=begin
Write a method that takes a first name, a space, and a last name passed as a
single String argument, and returns a string that contains the last name,
a comma, a space, and the first name.

swap_name('Joe Roberts') == 'Roberts, Joe'
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

def swap_name(str)
  str.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'