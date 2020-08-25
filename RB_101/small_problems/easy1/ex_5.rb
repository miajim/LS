# RB101-RB109 Small Problems
# Easy 1 - Problem 5: Reverse It (Part 1)
# Mon. 08/24/20

# PROBLEM STATEMENT
# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# Examples:

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# The tests above should print true.

=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  one argument, string
Outputs 
  one string
Rules/Implicit Requirements
  string objects only in input 
  words themselves are not reversed, but their order is
  can input an empty string
  words are separated by one space only
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# The tests above should print true.

DATA STRUCTURE
Inputs
  string
Rules

ALGORITHM
  convert string to array
  reverse the values in the array
  concatenate the values in the array to form the new reversed string
=end

# CODE
def reverse_sentence(string)
  string.split.reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'