# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 9
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
Given this data structure, return a new array of the same structure but with the
sub arrays being ordered (alphabetically or numerically as appropriate) in descending order..
=end
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
sorted_arr = arr.map do |subarray|
  subarray.sort { |a, b| b <=> a }
end

p sorted_arr
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
identical
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
