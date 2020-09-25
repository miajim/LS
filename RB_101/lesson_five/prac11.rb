# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 11
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
Given the following data structure use a combination of methods,
including either the select or reject method, to return a new array identical in
structure to the original but containing only the integers that are multiples of 3.
=end
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
mult_3 = arr.map do |subarray|
  subarray.select do |num|
    num % 3 == 0
  end
end

p mult_3
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
identical
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
