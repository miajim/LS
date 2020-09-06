# RB101-RB109 Lesson 3
# Practice Problems - Medium 1: Question 3
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
Alan wrote the following method, which was intended to show all of the factors
of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
Alyssa noticed that this will fail if the input is 0, or a negative number,
and asked Alan to change the loop.
How can you make this work without using begin/end/until?
Note that we're not looking to find the factors for 0 or negative numbers,
but we just want to handle it gracefully instead of raising an exception or going
into an infinite loop.

Bonus 1
What is the purpose of the number % divisor == 0 ?

Bonus 2
What is the purpose of the second-to-last line (line 8) in the method
(the factors before the method's end)?

=end

# CODE
# Since divisor is set to number to start, you can use a while loop instead.
# If divisor is less than or equal to zero, the while loop will not execute
# and will return an empty factors array

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  #factors
end

p factors(15)
p factors(20)

# Bonus 1: if number % divsior == 0 is present to check that the divisor is in
# fact a factor of the number

# Bonus 2: the purpose of the last line of the method is to ensure that the
# method returns the array factors, since this will be the last line that it
# executes. If it weren't present the method will return nil, since
# until divisor == 0 would be the last line executed
# See while loop documentation --> the result of a while loop is neil unless
# break is used to supply a value.

# LS Solution
# (similar)