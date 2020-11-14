# RB101-RB109 Small Problems
# Medium 1 - Problem 7: Word to Digit
# Tues. 10/27/20

# PROBLEM STATEMENT
=begin
Write a method that takes a sentence string as input, and returns the same
string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - one string
  Outputs
    - one string, with strings representing digits replaced with the corresponding digit
Rules/Implicit Requirements
  - words are separated by spaces
  - punctuation can be used and should be accounted for (e.g., "four." => "4.")
  -
Clarifying Questions
  - Do we have to return a modified string or can it be a new string?
Mental Model (optional)
  -

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    - string, convert to an array of words
  Rules
    - use an array constant with 'zero' through 'nine' as reference

ALGORITHM
  - split the string into words (i.e., at spaces)
  - iterate over the array of words, mapping each word to a "new" word
  - iterate over the array constant
    - if the current word includes a word from the digits array
      - return the index where the word occurs
      - remove the digit from the word (which keeps any characters that remain)
      - concatenate the index as a string to any characters that remain
    - otherwise return the word
  - return the new array and join by spaces
=end

DIGITS = ['zero', 'one', 'two', 'three', 'four',
'five', 'six', 'seven', 'eight', 'nine']
PUNCTUATION = %w(, ! . ? - ' ")

# def word_to_digit(str)
#   str.split(" ").each_with_object([]) do |word, arr|
#     replaced = false
#     DIGITS.each do |digit|
#       if word.include?(digit)
#         arr << (DIGITS.index(digit).to_s + word.delete(digit))
#         replaced = true
#       end
#     end
#     arr << word unless replaced
#   end.join(" ")
# end

=begin
Alternative algorithm using Hint 1 suggestion (use String#gsub!)
- iterate through the array constant
- Perform a permanent global substitution of every string in the array constant
- Return the mutated string.
=end

# Refactored Solution
def word_to_digit(str)
  DIGITS.each_with_index { |digit, i| str.gsub!(digit, i.to_s) }
  str
end

# LS Solution (using regex prevents replacement of a substring - if it existed)
DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'