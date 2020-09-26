# RB101-RB109 Small Problems
# Easy 8 - Problem 10: Get The Middle Character
# Sat. 09/26/20

# PROBLEM STATEMENT
=begin
Write a method that takes a non-empty string argument, and returns the middle
character or characters of the argument. If the argument has an odd length, you
should return exactly one character. If the argument has an even length, you
should return exactly two characters.

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
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

def center_of(str)
  mid = str.length / 2.0
  str.length.odd? ? str[(mid).ceil - 1] : str[(mid-1)..(mid)]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'