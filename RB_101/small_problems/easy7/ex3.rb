# RB101-RB109 Small Problems
# Easy 7 - Problem 3: Capitalize Words
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that takes a single String argument and returns a new string that
contains the original value of the argument with the first character of every
word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

Further Exploration
Ruby conveniently provides the String#capitalize method to capitalize strings.
Without that method, how would you solve this problem? Try to come up with at least two solutions.
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
def word_cap(str)
  str.split().map { |word| word.capitalize }.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further Exploration
# Option 1
def word_cap(str)
  word_arr = str.split().map do |word|
    new_word = ""
    word.chars.each_with_index do |char, i|
      i == 0 ?  new_word << char.upcase : new_word << char.downcase
    end
    new_word
  end
  word_arr.join(" ")
end

# Option 2
def word_cap(str)
  str.split().map { |word| word[0].upcase + word[1..-1].downcase }.join(" ")
end

p word_cap('four score and seven')  == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'