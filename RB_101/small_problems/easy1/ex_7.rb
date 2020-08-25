# RB101-RB109 Small Problems
# Easy 1 - Problem 7: Stringy Strings
# Tues. 08/25/20

# PROBLEM STATEMENT
# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. 
# The length of the string should match the given integer.

# Examples:

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# The tests above should print true.

=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  one positive integer 
Outputs 
  string (alternating 1's and 0's, starting with 1)
Rules/Implicit Requirements
  length of string = integer
Clarifying Questions
  Assuming no argument is not acceptable
Mental Model (optional)

EXAMPLES/TEST CASES
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

DATA STRUCTURE
Inputs
  integer
Rules
  concatenate 1 or 0 to a string

ALGORITHM
  define a method called stringy that takes one arg
  define an empty string or an empty array 
  while the # of characters of the string is <= (or < if using an array) arg input
  append 1 if i is odd (if counting from 1, even if counting from 0)
  append 0 if i is even (if counting from 1, odd if counting from 0)
  print string or join array elements and then print
  
=end

# CODE
# def stringy(num)
#   string = ""
#   count = 0
#   while string.length < num
#     if count.even?
#         string.concat("1")
#     else
#         string.concat("0")
#     end
#     count += 1
#   end 
#   string
# end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# REFACTORED
# Rules using input integer, num
# if num is even, num / 2 * "10"
# if num is odd, (num-1)/2 * "10" + "1"
# def stringy(num)
#   num.even? ? "10"*(num/2) : "10"*(num/2) + "1"
# end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# FURTHER EXPLORATION
# Modify stringy so it takes an additional optional argument that defaults to 1. 
# If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy(num, opt=1)
  if opt == 1
    num.even? ? "10"*(num/2) : "10"*(num/2) + "1"
  elsif opt == 0
    num.even? ? "01"*(num/2) : "01"*(num/2) + "0"
  end
end

puts stringy(6) == '101010'
puts stringy(6, 1) == '101010'
puts stringy(6, 0) == '010101'
puts stringy(7) == '1010101'
puts stringy(7, 0) == '0101010'