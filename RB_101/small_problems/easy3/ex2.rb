# RB101-RB109 Small Problems
# Easy 3 - Problem 2: Arithmetic Integer
# Sun. 09/06/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

Example

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
def prompt(message)
  puts "==> #{message}"
end

prompt("Enter the first number: ")
num1 = gets.chomp.to_i

prompt("Enter the second number: ")
num2 = gets.chomp.to_i

# add
prompt("#{num1} + #{num2} = #{num1 + num2}")

# subtract
prompt("#{num1} - #{num2} = #{num1 - num2}")

# multiply
prompt("#{num1} * #{num2} = #{num1 * num2}")

# divide
prompt("#{num1} / #{num2} = #{num1 / num2}")

# mod
prompt("#{num1} % #{num2} = #{num1 % num2}")

# exp
prompt("#{num1} ** #{num2} = #{num1 ** num2}")

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
There are some edge cases to consider in this exercise.
We have to be careful of not having a second number that is zero.
What if we wanted to use floats instead of integers? --> use #to_f instead, consider rounding results
How does this change this problem?

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes