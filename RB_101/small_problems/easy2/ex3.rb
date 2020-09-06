# RB101-RB109 Small Problems
# Easy 2 - Problem 3: Tip Calculator
# Fri. 09/04/20

# PROBLEM STATEMENT
=begin
Create a simple tip calculator.
The program should prompt for a bill amount and a tip rate.
The program must compute the tip and then display both the tip and
the total amount of the bill.

Example:

What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

Further Exploration
Our solution prints the results as $30.0 and $230.0 instead of the more usual
$30.00 and $230.00. Modify your solution so it always prints the results with
2 decimal places.

Hint: You will likely need Kernel#format for this.

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
print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
percentage = gets.chomp.to_f

tip = (percentage / 100 * bill).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{tip},
The total is $#{total}."

# LS Solution Notes



# Further Exploration
puts "The tip is $#{format("%.2f", tip)},
The total is $#{format("%.2f", total)}."