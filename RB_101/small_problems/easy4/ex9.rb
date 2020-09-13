# RB101-RB109 Small Problems
# Easy 4 - Problem 9: Convert a Number to a String!
# Sat. 09/12/20

# PROBLEM STATEMENT
=begin
In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers.
In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc.
Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Examples

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

Further Exploration
One thing to note here is the String#prepend method; unlike most string mutating methods,
the name of this method does not end with a !. However, it is still a mutating method - it changes the string in place.

This is actually pretty common with mutating methods that do not have a corresponding non-mutating form. chomp! ends with a !
because the non-mutating chomp is also defined. prepend does not end with a ! because there is no non-mutating form of prepend.

How many mutating String methods can you find that do not end with a !. Can you find any that end with a !, but don't have a non-mutating form?
Does the Array class have any methods that fit this pattern? How about the Hash class?
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
Outputs
Rules/Implicit Requirements
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
Inputs
Rules

ALGORITHM
=end

# CODE
DIGITS = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9
  }

def plus_or_minus(str)
  if str.chr == ("-")
    str.delete!(str[0])
    multiplier = -1
  elsif str.chr == ("+")
    str.delete!(str[0])
    multiplier = 1
  else
    multiplier = 1
  end
  multiplier
end

def string_to_signed_integer(str)
  int_arr = []

  multiplier = plus_or_minus(str)

  str.each_char { |char| int_arr << DIGITS[char] }

  int_arr.reverse! # similar to the return value of Integer#digits

  # multiply each value in the array by 10^index and sum
  sum = 0
  int_arr.each_with_index do |num, i|
    sum += num * (10 ** i)
  end

  sum*multiplier # return
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# Further Exploration (Refactored LS Solution)

def string_to_integer(str)
  int_arr = []

  str.each_char { |char| int_arr << DIGITS[char] }

  int_arr.reverse! # similar to the return value of Integer#digits

  # multiply each value in the array by 10^index and sum
  sum = 0
  int_arr.each_with_index do |num, i|
    sum += num * (10 ** i)
  end
  sum # return
end

# ALGORITHM
# Create a new variable that holds an empty return string
# Find the place-value representation of the number
  # Use Integer#digits (returns an array with the least significant digit as the 1st array element)
# For every value in the return array, look up the string value in the STR_DIGITS array and append to the return variable
# Return the value

STR_DIGITS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

def integer_to_string(int)
  digits = int.digits().reverse()
  digits.each_with_object("") { |num, str| str << STR_DIGITS[num] }
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Further Exploration
 # String methods that are mutating without a !:
 # concat, replace, insert, prepend, setbyte

 # String methods that end with !, but do not have a non-mutating form:

 # Similar Array methods:
 # concat, delete, delete_at, delete_if

 # Similar Hash methods: