# RB101-RB109 Small Problems
# Easy 2 - Problem 4: When will I Retire?
# Fri. 09/04/20

# PROBLEM STATEMENT
=begin
Build a program that displays when the user will retire and
how many years she has to work till retirement.

Example:

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

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
print "What is your age? "
age = gets.chomp.to_i
print "At what age would you like to retire? "
retire_age = gets.chomp.to_i

years_to_retirement = retire_age - age
retire_year = 2020 + years_to_retirement

puts "It's 2020. You will retire in #{retire_year}.
You have only #{years_to_retirement} of work to go!"

# LS Solution Notes
# Use Time.now to get the current date (returns a Time object).
# Time#year gets the current year from the Time object
# e.g., current_year = Time.now.year
