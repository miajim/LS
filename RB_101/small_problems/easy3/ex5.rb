# RB101-RB109 Small Problems
# Easy 3 - Problem 5: Squaring an Argument
# Sun. 09/06/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Using the multiply method from the "Multiplying Two Numbers" problem,
write a method that computes the square of its argument
(the square is the result of multiplying a number by itself).

Example:

square(5) == 25
square(-8) == 64

Further Exploration
What if we wanted to generalize this method to a "power to the n" type method:
cubed, to the 4th power, to the 5th, etc.
How would we go about doing so while still using the multiply method?

=end


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution

def multiply(num1, num2)
  num1 * num2
end

# def square(num)
#   multiply(num, num)
# end

# p square(5) == 25   # true
# p square(-8) == 64  # true

# def power_to_n(num, power)
#   n = power.to_f / 2
#   multiply(num, num) ** n
# end

# p power_to_n(2, 4) == 16
# p power_to_n(8, 3) == 512
# p power_to_n(3, 6) == 729


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

# For the further exploration, I like 14jdelap's solution of using recursion:
def power_to_n(num, power)
  if power == 0
    return 1
  elsif power == 1
    return num
  else
    multiply(num, power_to_n(num, power - 1))
  end
end

p power_to_n(2, 4) == 16
p power_to_n(8, 3) == 512
p power_to_n(3, 6) == 729