# RB101-RB109 Small Problems
# Easy 5 - Problem 5: Clean up the words
# Wed. 09/16/20

# PROBLEM STATEMENT
=begin
Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters,
write a method that returns that string with all of the non-alphabetic characters replaced by spaces.
If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

Examples:

cleanup("---what's my +*& line?") == ' what s my line '

Further Exploration
If you originally wrote this method with regular expressions, try writing it without regular expressions.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  one string (has a combination of lowercase letters(words) and non-alphabetic characters)
Outputs
  one string
Rules/Implicit Requirements
  each non-alphabetic character should not have it's own space (i.e., only one space per one or more non-alphabetic character)
Clarifying Questions
  Are numbers considered non-alphabetic? Yes
Mental Model (optional)
  Remove characters from a string that are not part of the alphabet and replace one or more of these characters by a single space.
EXAMPLES/TEST CASES

DATA STRUCTURE
Inputs
Rules

ALGORITHM
- Take each character in the input string and check to see if it is in the alphabet
- If it is non-alphabetic, replace with a space, however only do so if the preceeding character was not a single space
- Return a new string meeting the requirements
- character is in the alphabet --> push to new string
- character is not in the alphabet --> replace with a space if the preceeding character is not a space
- character is a space --> push to new string

=end

# CODE
def cleanup(dirty_str)
  clean_str = ""
  previous_char = ""

  dirty_str.each_char do |char|
    if ("a".."z").include?(char)
      clean_str << char
    else
      (clean_str << " ") unless (previous_char == " ")
    end
    previous_char = clean_str.chars.last
  end
  clean_str
end

p cleanup("---what's my +*& line?")  ==  ' what s my line '

# My solution is almost identical to LS Solution 1
# See LS Solution 2 for a refactored version (uses RegExp and String#squeeze)