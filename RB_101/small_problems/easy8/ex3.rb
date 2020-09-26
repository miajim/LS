# RB101-RB109 Small Problems
# Easy 8 - Problem 3: Leading Substrings
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that returns a list of all substrings of a string that start at
'the beginning of the original string. The return value should be arranged in
order from shortest to longest substring.

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
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

def leading_substrings(str)
  i = 0
  arr = []
  while i < str.length
    arr << str[0..i]
    i += 1
  end
  arr
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# LS Solution uses Integer#upto starting at 0 and ending at (str.size - 1)