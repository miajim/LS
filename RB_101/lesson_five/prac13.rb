# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 13
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
Given the following data structure, return a new array containing the same
sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.
The sorted array should look like this:
[[1, 8, 3], [1, 6, 7], [1, 4, 9]]
=end
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# For each subarray in the array, find the largest maximum odd value
# sort the outer array by this max value
sorted_arr = arr.sort_by do |subarray|
  subarray.select { |num| num.odd? }
end

p sorted_arr
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
Doesn't use Array#max, because it's technically not needed since the first odd integer
of each array is the same and thus will still be sorted appropriately by the largest
odd integer
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
