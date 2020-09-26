# RB101-RB109 Small Problems
# Easy 8 - Problem 6: Fizzbuzz
# Sat. 09/26/20

# PROBLEM STATEMENT
=begin
Write a method that takes two arguments: the first is the starting number,
and the second is the ending number. Print out all numbers between the two
numbers, except if a number is divisible by 3, print "Fizz", if a number is
divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5,
print "FizzBuzz".

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
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

def fizzbuzz(start_num, end_num)
  arr = (start_num..end_num).to_a.map do |num|
    if num % 3 == 0 && num % 5 == 0
      "FizzBuzz"
    elsif num % 3 == 0 || num % 5 == 0
      ((num % 3 == 0) ? "Fizz" : "Buzz")
    else
      num
    end
  end
  puts arr.join(", ")
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz