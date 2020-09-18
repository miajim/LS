# RB101-RB109 Small Problems
# Easy 5 - Problem 7: Letter Counter (Part 2)
# Thurs. 09/17/20

# PROBLEM STATEMENT
=begin
Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

Examples

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

If you haven't encountered String#delete before, take a few minutes to read up on it,
and its companion String#count (you need to read about #count to get all of the information you need to understand #delete).
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
    key = word.gsub(/[^a-z]/i, "").length
    if results.key?(key)
      results[key] += 1
    else
      results[key] = 1
    end
  end
  results
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

# See my notes for further exploration