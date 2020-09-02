# RB101-RB109 Small Problems
# Easy 2 - Problem 1: How old is Teddy?
# DATE 08/30/20

# PROBLEM STATEMENT

# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.

# Example Output

# Teddy is 69 years old!

=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  no user inputs (Teddy's age is randomly generated)
Outputs
  a string
Rules/Implicit Requirements
  Teddy's age is randomly generated (i.e., no user input required)
Clarifying Questions
  Should the program ask the user if they want to repeat finding Teddy's age?
  Is the range 20-200 inclusive of both 20 and 200?
Mental Model (optional)

EXAMPLES/TEST CASES
Teddy is 69 years old!

DATA STRUCTURE
Inputs
  (none)
Rules
randomly generated number is an integer

ALGORITHM

Define a variable that generates a randomly generated number.
Use string interpolation to output the string with the randomly generated number.

=end

# CODE
loop do
  puts "Finding Teddy's age..."
  Kernel.sleep(1.0)
  age = Random.rand(20..200)
  puts "Teddy is #{age} years old!"
  puts "Repeat finding Teddy's age?(y/n) "
  repeat = Kernel.gets().chomp()
  break unless repeat.match(/^y/i)
end