# RB101-RB109 Small Problems
# Easy 2 - Problem 5: Greeting a user
# Fri. 09/04/20

# PROBLEM STATEMENT
=begin
Write a program that will ask for user's name.
The program will then greet the user.
If the user writes "name!" then the computer yells back to the user.

Examples

What is your name? Bob
Hello Bob.
What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

Further Exploration
Try modifying our solution to use String#chomp! and String#chop!, respectively.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
Outputs
Rules/Implicit Requirements
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
Inputs
Rules

ALGORITHM
=end

# CODE
print "What is your name? "
name = gets.chomp!

if name.end_with?("!")
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# LS Solution Notes


# Further Exploration
# See code above, chomp! is unnecessary, but used anyway