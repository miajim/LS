# RB101-RB109 Small Problems
# Easy 5 - Problem 1: ASCII String Value
# Sun. 09/13/20

# PROBLEM STATEMENT
=begin
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument.
The ASCII string value is the sum of the ASCII values of every character in the string.
(You may use String#ord to determine the ASCII value of a character.)

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

Further Exploration

There is an Integer method such that:

char.ord.mystery == char

where mystery is our mystery method. Can you determine what method name should be used in place of mystery?
What happens if you try this with a longer string instead of a single character?

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
# Note: Empty string does not have an ascii ord value
# split the input string into characters OR iterate over each character directly
# While iterating over each character determine the ASCII value
# Add the ASCII value of that character to a tallying sum

=end

# CODE
def ascii_value(str)
  value = 0
  if str.empty?
    value
  else
    str.each_char { |char| value += char.ord}
    value
  end
end

# refactored
def ascii_value(str)
  str.empty? ? 0 : str.chars().reduce(0) { |value, char| value + (char.ord)}
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further exploration
# The "mystery method" is Integer#chr. It "returns a string containing the character represented by the int's value according to encoding."
# When used with a string longer than one character, it returns the encoding for the first character only, similar to String#ord.