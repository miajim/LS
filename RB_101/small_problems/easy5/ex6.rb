# RB101-RB109 Small Problems
# Easy 5 - Problem 6: Letter Counter (Part 1)
# Thurs. 09/17/20

# PROBLEM STATEMENT
=begin
Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

Examples

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

Further Exploration
Take some time to read about Hash::new to learn about the different ways to initialize a hash with default values.
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
- create an empty hash to return the key-value pairs
- split the input string into words (at spaces) --> array
- iterate through the array of words
  - determine the length of the word
  - if the length of the word is a key in the hash, then add 1 to value for that key in the hash
  - if the length does not exist in the hash, then create a new key with that length and a value of 1
- return the hash

=end

# CODE
def word_sizes(str)
  results = {}
  str.split.each do |word|
    key = word.length
    if results.key?(key)
      results[key] += 1
    else
      results[key] = 1
    end
  end
  results
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# See my notes for further exploration