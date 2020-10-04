# RB101-RB109 Small Problems
# Easy 9 - Problem 3: Always Return Negative
# Sat. 09/26/20

# PROBLEM STATEMENT
=begin
Write a method that takes a number as an argument. If the argument is a
positive number, return the negative of that number. If the number is 0 or
negative, return the original number. Examples:

negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

Further Exploration
There is an even shorter way to write this but it isn't as immediately intuitive.

def negative(number)
  -number.abs
end

This works by flipping the problem on the head. It straightaway converts it
to a positive number with Numeric#abs and then prepends it with a negative
operator to make it negative. abs returns the absolute value of a number
(the non-negative value of a number without regard to its sign).

Thus, instead of operating by checking the value and proceeding based on the
evaluation, the opposite can be applied by stripping it of its sign, then
giving it the negative sign.

This is clearly shorter. However is it superior?
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

def negative(num)
  num.positive? ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

# Further Exploration
# I think using #abs doesn't make absolute sense for a number like 0 (even
# though it is handled correctly by the definition).