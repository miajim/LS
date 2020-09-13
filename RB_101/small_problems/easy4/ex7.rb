# RB101-RB109 Small Problems
# Easy 4 - Problem 7: Convert a String to a Number!
# Fri. 09/11/20

# PROBLEM STATEMENT
=begin
The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer.
String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer.
You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters;
assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc.
Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Examples

string_to_integer('4321') == 4321
string_to_integer('570') == 570

Further Exploration
Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

Example:

hexadecimal_to_integer('4D9f') == 19871

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  string of numbers
Outputs
  integer
Rules/Implicit Requirements
  input is completely numeric (i.e., only integers >= 0)
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES
  string_to_integer('4321') == 4321
  string_to_integer('570') == 570

DATA STRUCTURE
Inputs
  string
Rules

ALGORITHM
  - divide the input string into individual characters
  - compare each character to keys in a hash
    - hash contains the digits 0 - 9 (keys: digits as strings, values: digits as ints)
  - if the string is equal to one of the characters in the hash, return the value
  - append the value to a variable (TBD if empty array or zero)
  - join the values in the array (separate method? join may not work like this for ints)
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

  # using reduce instead
  # index = 0
  # int_arr.reduce(0) do |sum, num|
  #   index += 1
  #   sum + num * (10 ** (index-1))
  # end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570


# Further Exploration
HEX_DIGITS = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "A" => 10,
    "B" => 11,
    "C" => 12,
    "D" => 13,
    "E" => 14,
    "F" => 15
  }

def hexadecimal_to_integer(str)
  int_arr = []

  str.upcase!.each_char { |char| int_arr << HEX_DIGITS[char] }

  int_arr.reverse! # similar to the return value of Integer#digits

  # multiply each value in the array by 10^index and sum
  sum = 0
  int_arr.each_with_index do |num, i|
    sum += num * (16 ** i)
  end
  sum # return
end

p hexadecimal_to_integer('4D9f') == 19871