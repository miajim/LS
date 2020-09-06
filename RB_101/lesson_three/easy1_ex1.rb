# RB101-RB109 Lesson 3
# Practice Poblems - Easy 1: Question 1
# Thurs. 09/03/2020

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# I would expect each number in the numbers array to be printed, with each
# number on its own line.
# Array#uniq returns an array with duplicate values removed, but does not
# mutate the original array (the array it was called on)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# puts method calls #to_s on its args
# p calls #inspect on its args, formatting is different on the output compared
# to puts
# puts numbers.inspect would be the same as p numbers

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

