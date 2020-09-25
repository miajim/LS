# RB101-RB109 Small Problems
# Easy 6 - Problem 3: Fibonacci Number Location by Length
# Wed. 09/23/20

# PROBLEM STATEMENT
=begin
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such
that the first 2 numbers are 1 by definition, and each subsequent number is the
sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results
grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
354,224,848,179,261,915,075 -- that's enormous, especially considering that it
takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci
number that has the number of digits specified as an argument.
(The first Fibonacci number has index 1.)

Examples:
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

You may assume that the argument is always greater than or equal to 2.

Further Exploration
Fibonacci numbers are sometimes used in demonstrations of how to write recursive
methods. Had we tried to use a recursive method, it probably would have resulted
in the program running out of stack space. Ruby isn't well equipped to deal with
the level of recursion required for a recursive solution.

We'll explore Fibonacci numbers again, along with the usual recursive solutions, later in the Medium exercises.



--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - one integer
  Outputs
    - one integer
Rules/Implicit Requirements
  - output must be the INDEX of the first Fibonacci number with n digits
  - input argument will always be an integer >= 2
  - index does not start counting at zero as usual, starts at 1
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
  - determine the first number in the fibonacci sequence
    - create a separate method to calculate this
  - check if the number's number of digits is equal to the input integer
    - if not, append the number to an array and calculate the next fibonacci number, repeat
    - if yes, append the number to an array and return the length of the array
=end

# CODE

# input will always be >= 1
def fibonacci(n)
  if n == 1 || n == 2
    fib_num = 1
  else
    fib_num = fibonacci(n-1) + fibonacci(n-2)
  end
  fib_num
end

# The runtime is super long with this method for inputs >= 9.
# def find_fibonacci_index_by_length(num_digits)
#   count = 0
#   loop do
#     count += 1
#     current_fib_num = fibonacci(count)
#     break if current_fib_num.digits.length == num_digits
#   end
#   count
# end

# write a recursive find_fibonacci_index_by length method instead
def find_fibonacci_index_by_length(num_digits)
  if num_digits == 2
    count = 7
  else
    count = 1 + find_fibonacci_index_by_length(num_digits-1)
    loop do
      current_fib_num = fibonacci(count)
      break if current_fib_num.to_s.length == num_digits
      count += 1
    end
    count
  end
end
# This seems to be slightly worse in terms of runtime than the original solution.

# p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

# Brute force solution (similar to LS)
def find_fibonacci_index_by_length(num_digits)
  fib1 = 1
  fib2 = 1
  index = 2
  loop do
    index +=1
    current_fib_num = fib1 + fib2
    if current_fib_num.to_s.length == num_digits
      break
    else
      fib1, fib2 = fib2, current_fib_num
    end
  end
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847