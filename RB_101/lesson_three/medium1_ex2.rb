# RB101-RB109 Lesson 3
# Practice Problems - Medium 1: Question 2
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)
Why is this and what are two possible ways to fix this?

# CODE
An error will occur because (40 + 2) is not a string.
This can be fixed by interpolating the calculation or converting it to a string.
=end
puts "the value of 40 + 2 is #{(40 + 2)}"
# or
puts "the value of 40 + 2 is " + (40 + 2).to_s

# LS Solution
# (same answer)
# Note that the original statement will raise a TypeError: no implicit conversion
# of Integer into String