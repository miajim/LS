# RB101-RB109 Small Problems
# Easy 7 - Problem 4: Swap Case
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that takes a string as an argument and returns a new string in
which every uppercase letter is replaced by its lowercase version, and every
lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
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
def swapcase(str)
  new_str = ""
  str.each_char do |char|
    if char =~ /[a-z]/
      new_str << char.upcase
    elsif char =~ /[A-Z]/
      new_str << char.downcase
    else
      new_str << char
    end
  end
  new_str
end

p swapcase('CamelCase')  == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'