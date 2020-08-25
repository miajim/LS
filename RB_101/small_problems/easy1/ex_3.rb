# RB101-RB109 Small Problems
# Easy 1 - Problem 3: List of Digits
# Mon. 08/24/20

# PROBLEM STATEMENT
# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# Examples:

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true
=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  one positive integer
Outputs
  array of numbers
Rules/Implicit Requirements
  Inputs will only be positive numbers (>0), do not need to check for this. 
  Numbers will not contain any spaces or special characters, will not be checking for this
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

DATA STRUCTURE
Inputs
  positive integer
Rules

ALGORITHM
  define empty array
  convert integer to string
  split string, each character is an individual string
  append each individual string to array
=end

# CODE
def digit_list(num)
    ary = []
    num.to_s.each_char {|x| ary << x.to_i }
    ary
end 


# Alternative solution
def digit_list(num)
  num.digits.reverse
end