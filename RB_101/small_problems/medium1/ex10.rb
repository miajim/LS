# RB101-RB109 Small Problems
# Medium 1 - Problem 10: Fibonacci Numbers (Last Digit)
# Thurs. 10/29/20

# PROBLEM STATEMENT

=begin
In the previous exercise, we developed a procedural method for computing the
value of the nth Fibonacci numbers. This method was really fast, computing the
20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit
of the nth Fibonacci number.

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4
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

# Using LS Procedural Soltuion
# def fibonacci(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, first + last]
#   end
#   last
# end

# def fibonacci_last(pos)
#   # fibonacci(pos).to_s[-1].to_i
#   fibonacci(pos) % 10 # < --  LS Solution uses % 10 in the fibonacci def directly
# end

# def fibonacci_last(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, (first + last) % 10]
#     p [first, last]
#   end
#   last
# end

=begin
Golden Ratio
Take two successive Fibonacci numbers, and their ratio is very close to the
Golden Ratio (1.618034)
Use the Golden Ratio to calculate any Fibonacci number:

X_n = (ratio^n - (1 - ratio)^n) / sqrt(5)

=end


def fibonacci_last(n)
  ((1.618034 ** n - (1 - 1.618034) ** n) / Math.sqrt(5)) % 10
end

# Further Exploration
# p fibonacci_last(123_456_789_987_745) # --> 5

# p fibonacci_last(3)
# p fibonacci_last(4)
# p fibonacci_last(5)
# p fibonacci_last(6)
# p fibonacci_last(7)
# p fibonacci_last(8)
# p fibonacci_last(9)
# p fibonacci_last(10)
# p fibonacci_last(11)
# p fibonacci_last(12)
# p fibonacci_last(13)
# p fibonacci_last(14)
# p fibonacci_last(15)          # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(16)
# p fibonacci_last(17)
# p fibonacci_last(18)
# p fibonacci_last(19)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4
