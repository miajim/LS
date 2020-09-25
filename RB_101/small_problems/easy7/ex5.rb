# RB101-RB109 Small Problems
# Easy 7 - Problem 5: Staggered Caps (Part 1)
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that takes a String as an argument, and returns a new String that
contains the original value using a staggered capitalization scheme in which
every other character is capitalized, and the remaining characters are lowercase.
Characters that are not letters should not be changed, but count as characters
when switching between upper and lowercase.

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

Further Exploration
Can you modify this method so the caller can request that the first character be
downcased rather than upcased? If the first character is downcased, then the second character should be upcased, and so on.

Hint: Use a keyword argument.
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
def staggered_case(str)
  new_str = ""
  str.chars.each_with_index do |char, i|
    i % 2 == 0 ? new_str << char.upcase : new_str << char.downcase
  end
  new_str
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Further Exploration
def staggered_case(str, first_downcase = false)
  new_str = ""
  str.chars.each_with_index do |char, i|
    first_downcase ? new_str << char.downcase : new_str << char.upcase
    first_downcase = !first_downcase
  end
  new_str
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('I Love Launch School!', true) == 'i lOvE LaUnCh sChOoL!'
p staggered_case('ALL_CAPS', true) == 'aLl_cApS'
p staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'