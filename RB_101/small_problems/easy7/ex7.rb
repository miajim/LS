# RB101-RB109 Small Problems
# Easy 7 - Problem 7: Multiplicative Average
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that takes an Array of integers as input, multiplies all the numbers together,
divides the result by the number of entries in the Array,
and then prints the result rounded to 3 decimal places.
Assume the array is non-empty.


show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

Further Exploration
What happens if you omit the call to #to_f on the first line of our method?

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
def show_multiplicative_average(arr)
  puts "The result is #{format("%.3f", arr.reduce(:*).to_f / arr.length)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# Further Exploration
# If #to_f is not called somewhere when calculating the multiplicative average,
# The result would remain an integer instead of a float, and thus would show
# 000 after the decimal.