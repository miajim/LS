# RB101-RB109 Small Problems
# Easy 1 - Problem 6: Reverse It (Part 2)
# Mon. 08/24/20

# PROBLEM STATEMENT
# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. 
# Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# Examples:

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  one argument, string of at least one word
Outputs 
  original string argument with words that have 5 or more characters, reversed 
Rules/Implicit Requirements
  each string will only have letters and spaces
  Assuming spaces are only in between words (i.e., no space before the 1st word, no space after the last word)
  Assuming only once space will be inbetween words. 
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

DATA STRUCTURE
Inputs
  string
Rules

ALGORITHM
  Split the string using a blank space as the delimiter and save each individual string as a value in an array
  Loop through the created array and if the length of a given value (word) is greater than or equal to 5 characters, 
    replace the value in the array with the reversed word. 
  Print out the array values as concatenated strings
=end

# CODE
# Using Problem 5 as a starting point: 
# def reverse_sentence(string)
#   string.split.reverse.join(" ")
# end

def reverse_words(string)
    ary = string.split.map do |word| 
      if word.length >= 5  # size is an alias of length
        word.reverse 
      else
        word
      end
    end
    ary.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
