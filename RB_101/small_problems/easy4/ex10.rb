# RB101-RB109 Small Problems
# Easy 4 - Problem 10: Convert a Signed Number to a String!
# Sat. 09/12/20

# PROBLEM STATEMENT
=begin

In the previous exercise, you developed a method that converts non-negative numbers to strings.
In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc.
You may, however, use integer_to_string from the previous exercise.

Examples

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

Further Exploration
Refactor our solution to reduce the 3 integer_to_string calls to just one.

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

# ALGORITHM
# Create a new variable that holds an empty return string
# Find the place-value representation of the number
  # Use Integer#digits (returns an array with the least significant digit as the 1st array element)
# For every value in the return array, look up the string value in the STR_DIGITS array and append to the return variable
# Return the value

STR_DIGITS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

def integer_to_string(int)
  digits = int.abs().digits().reverse()
  digits.each_with_object("") { |num, str| str << STR_DIGITS[num] }
end

def signed_integer_to_string(int)
  string = integer_to_string(int)
  if int > 0
    string.prepend("+")
  elsif int < 0
    string.prepend("-")
  else
    string
  end
end

# Further Exploration
  # Using the LS solution
  def signed_integer_to_string(number)
    sign = ""
    case number <=> 0
    when -1
      sign = "-"
      number *= -1
    when +1
      sign = "+"
    end
    sign + integer_to_string(number)
  end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
