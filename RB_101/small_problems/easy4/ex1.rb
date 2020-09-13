# RB101-RB109 Small Problems
# Easy 4 - Problem 1: Short Long Short
# Fri. 09/11/20

# PROBLEM STATEMENT
=begin
Write a method that takes two strings as arguments,
determines the longest of the two strings, and then returns the result of
concatenating the shorter string, the longer string, and the shorter string once again.
You may assume that the strings are of different lengths.

Examples:

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  - two strings of different lengths (i.e., input1.length =/= input2.length)
Outputs
  - one concatenated string (shorter string + longer string + shorter string)
Rules/Implicit Requirements
  - inputs are only strings, not of the same length
  - strings will not have spaces or several "words"
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    - string
  Rules
    - N/A

ALGORITHM
  - determine which string has more characters
  - this string becomes the longer string, the other string becomes the shorter string
  - sandwich the longer string with the shorter string
=end

# CODE

def short_long_short(str1, str2)
  if str1.length > str2.length
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
