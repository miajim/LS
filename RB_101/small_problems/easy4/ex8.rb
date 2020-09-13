# RB101-RB109 Small Problems
# Easy 4 - Problem 8: Convert a String to a Signed Number!
# Sat. 09/12/20

# PROBLEM STATEMENT
=begin
In the previous exercise, you developed a method that converts simple numeric strings to Integers.
In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer.
The String may have a leading + or - sign; if the first character is a +, your method should return a positive number;
if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc.
You may, however, use the string_to_integer method from the previous lesson.

Examples

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

Further Exploration
In our solution, we call string[1..-1] twice, and call string_to_integer three times.
This is somewhat repetitive. Refactor our solution so it only makes these two calls once each.
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

def string_to_signed_integer(string)
  # case string[0]
  # when '-' then -string_to_integer(string[1..-1])
  # when '+' then string_to_integer(string[1..-1])
  # else          string_to_integer(string)
  # end
  str = (string[0] == "-" || string[0] == "+") ? string[1..-1] : string
  multiplier = (string[0] == "-") ? -1 : 1
  multiplier*string_to_integer(str)
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100