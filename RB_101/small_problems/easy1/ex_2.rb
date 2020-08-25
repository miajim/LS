# RB101-RB109 Small Problems
# Easy 1 - Problem 2: Odd
# Mon. 08/24/20

# PROBLEM STATEMENT
# Write a method that takes one integer argument, which may be positive, negative, or zero. 
# This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true
# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  one integer (pos, neg, 0)
Outputs 
  method should return boolean (T/F) 
Rules/Implicit Requirements
  No need to find the absolute value of the number, negative numbers can still be even/odd
Clarifying Questions
  Looks like the input will always be a valid integer value, no need to check for validity
  Is zero an even number? Even is defined as an integer multiple of 2, therefore zero is even. 
Mental Model (optional)

EXAMPLES/TEST CASES
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

DATA STRUCTURE
Inputs
  integer, store in variable
Rules

ALGORITHM
  define method named 'is_odd?' that takes 1 arg
  use ternary expression to determine if the number is T/F and print "True" or "False"
  use % for the operation
=end

# CODE
# def is_odd?(num)
#     num % 2 != 0 ? true : false # No need to use ternary expression, since the comparison operator will return T/F
# end

# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# Further Exploration
# If you weren't certain whether % were the modulo or remainder operator, how would you rewrite #is_odd? so it worked regardless?
def is_odd?(num)
  num.abs % 2 != 0 
end

# The Integer#remainder method performs a remainder operation in Ruby. 
# Rewrite #is_odd? to use Integer#remainder instead of %. Note: before version 2.4, Ruby used the Numeric#remainder method instead.

def is_odd?(num)
  num.remainder(2) != 0 # key here is != 0 instead of == 1, since it will return true for any negative or positive integers
end
