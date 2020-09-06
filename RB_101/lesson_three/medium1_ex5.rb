# RB101-RB109 Lesson 3
# Practice Problems - Medium 1: Question 5
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
A user passes in two numbers, and the calculator will keep computing the sequence
until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it,
he got an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
How would you fix this so that it works?

=end

# CODE
# The limit variable needs to be passed into the method as an argument
# in order for it to be recognized by the method.

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# LS Solution
# (similar)