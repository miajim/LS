# RB101-RB109 Small Problems
# Easy 9 - Problem 5: Uppercase Check
# Sun. 10/04/20

# PROBLEM STATEMENT
=begin
Write a method that takes a string argument, and returns true if all of the
alphabetic characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

Further Exploration
Food for thought: in our examples, we show that uppercase? should return true
if the argument is an empty string. Would it make sense to return false instead?
Why or why not?
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
  - loop through every character in the string
  - if the character is not alphabetic, go to the next character
  - if it is alphabetic, call upcase on the character and see if it is equal to
  - the original string
=end


# initial solution
# def uppercase?(str)
#   arr = []
#   str.each_char do |char|
#     if char =~ /[a-z]/i
#       arr << (char.upcase == char)
#     else
#       next
#     end
#   end
#   arr.all?
# end

# second (refactored) solution
# def uppercase?(str)
#   str.each_char { |char| return false if char =~ /[a-z]/ }
#   return true
# end


# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

# Further Exploration
# I think it would make more sense for the string to return false if it is empty
# since an empty string cannot by capitalized. This could be accommodated as
# follows:

def uppercase?(str)
  if str.empty?
    return false
  else
    str.each_char { |char| return false if char =~ /[a-z]/ }
    return true
  end
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == false
