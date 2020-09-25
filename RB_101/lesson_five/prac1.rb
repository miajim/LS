# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 1
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# Algorithm
# Convert each element in the array to an integer
  # check that it is an integer before converting
# Sort this new integer array
# Convert the sorted array back to strings

# Code
arr = ['10', '11', '9', '7', '8']
p arr.map { |num| num.to_i if num.to_i.to_s == num }.sort.map(&:to_s)
# misread the problem (sorted ascending instead of descending)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
arr.sort do |a,b|
  b.to_i <=> a.to_i # use the comparison operator <=>
end
# Note that this still returns a new array
# => ["11", "10", "9", "8", "7"]

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes