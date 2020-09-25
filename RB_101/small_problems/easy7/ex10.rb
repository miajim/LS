# RB101-RB109 Small Problems
# Easy 7 - Problem 10: The End is Near But Not Here
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

Further Exploration
Our solution ignored a couple of edge cases because we explicitly stated that
you didn't have to handle them: strings that contain just one word, and
strings that contain no words. Suppose we need a method that retrieves the
middle word of a phrase/sentence. What edge cases need to be considered?
How would you handle those edge cases without ignoring them?
Write a method that returns the middle word of a phrase or sentence.
It should handle all of the edge cases you thought of.
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

# CODE
# def penultimate(str)
#   str.split(" ")[-2]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# Further Exploration
=begin
Potential edge cases & how to handle them:
- string with an odd number of words
  - roundup to the nearest integer to determine the middle word
- string with one word
  - return the word
- empty string
  - return the empty string
- hyphenated words
  - considered one word
- non-alphabetical characters
  - a word will be considered as grouped characters with whitespace inbetween
  - i.e., numbers and the like can be considered words or part of words
=end

def middle_word(str)
  word_arr = str.split(" ")
  middle_index = (word_arr.size / 2.0).ceil() - 1
  str.empty? ? str : word_arr[middle_index]
end

p middle_word("last word is") == 'word'
p middle_word("Launch School is great!") == "School"
p middle_word("hey") == "hey"
p middle_word("") == ""
p middle_word("This number 444 is considered a word.") == "is"