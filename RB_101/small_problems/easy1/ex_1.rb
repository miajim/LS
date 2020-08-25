# RB101-RB109 Small Problems
# Easy 1 - Problem 1: Repeat Yourself
# Mon. 08/24/20

# PROBLEM STATEMENT
# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:
# repeat('Hello', 3)

# Output
# Hello 
# Hello
# Hello


=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  string, positive integer 
Outputs 
  strings
Rules/Implicit Requirements
  Must take at least one string argument
  Integer must be > 0
Clarifying Questions
  Must the method always take 2 arguments? Can a default value be assigned to the positive integer?
Mental Model (optional)
  Print the string the number of times indicated. 

EXAMPLES/TEST CASES
repeat('Hello', 3)
# => Hello
Hello 
Hello
repeat('Hello') 
# => Hello
repeat() 
# => not enough arguments (wrong # of args error)
repeat(3) 
# => 3
repeat('Hello', 2, 3) 
# => too many arguments (wrong # of args error)

DATA STRUCTURE
Inputs
  store string and integer in separate variables
Rules
  Default argument will be an integer with value 1
  
ALGORITHM
Write a method named 'repeat' that takes a string as the first argument and an integer as the second argument
and use a loop to print the string x number of times (can use Integer#times for this).

=end

# CODE
# require 'pry'

def repeat(string, num=1)
    num.times{|x| puts string} # Recall that the puts method converts each given object to a string. 
end

# binding.pry

repeat('Hello', 3)
# => Hello
# Hello
# Hello
repeat('Hello')
# => Hello
repeat()
# => wrong number of arguments (given 0, expected 1..2)
# repeat(3)
# => 3
repeat('Hello', 2, 3)
# => wrong number of arguments (given 3, expecte 1..2)