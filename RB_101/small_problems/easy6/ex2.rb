# RB101-RB109 Small Problems
# Easy 6 - Problem 2: Delete vowels
# Wed. 09/23/20

# PROBLEM STATEMENT
=begin
Write a method that takes an array of strings, and returns an array of the
same string values, except with the vowels (a, e, i, o, u) removed.

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Further Exploration
Ruby has all sorts of String methods that could accomplish this task. How did you end up solving this exercise?
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
  - define an array constant with vowels (a, e, i, o, u)
  - for each element in the input array
    - convert the string element to lowercase
    - iterate through the string, comparing each character to the vowel constant
    - delete the character if it's a vowel (i.e., append to new string if not a vowel)
  - append the new string element to the new array (or send the transformed value
    to the original array to produce a new array i.e., use #map)
  - return the new array with the modified strings

=end

# CODE
VOWELS = %w(a e i o u)

def remove_vowels(arr)
  arr.map do |string|
    new_str = ""
    string.each_char do |char|
      new_str << char unless VOWELS.include?(char.downcase)
    end
    new_str
  end
end

# Using RegExp
def remove_vowels(arr)
  arr.map do |string|
    new_str = ""
    string.each_char { |char| new_str << char unless char.downcase =~ /[aeiou]/ }
    new_str
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# LS Solution uses String#delete (non-mutating method) to remove vowels.
# This is a shorter solution since it doesn't require the explicit comparison of
# each character.