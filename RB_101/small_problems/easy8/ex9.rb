# RB101-RB109 Small Problems
# Easy 8 - Problem 9: Reverse the Digits in a Number
# Sat. 09/26/20

# PROBLEM STATEMENT
=begin
Write a method that takes a positive integer as an argument and returns that
number with its digits reversed. Examples:

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1

Don't worry about arguments with leading zeros - Ruby sees those as octal
numbers, which will cause confusing results. For similar reasons, the return
value for our fourth example doesn't have any leading zeros.
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

# shortcut way
def reversed_number(int)
  int.digits.join.to_i
end

# "manual" way
def reversed_number(int)
  arr = []
  (int.to_s.size).times do |num|
    int, digit = int.divmod(10)
    arr << digit
  end
  arr.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
