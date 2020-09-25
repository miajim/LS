# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 15
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
Given this data structure write some code to return an array which contains only
the hashes where all the integers are even.
=end
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# for every element in the outer array
# select the hash that has values that are all even
  # get the values in each hash (array)
    # check that all values in the array are even
result = arr.select do |hsh|
  hsh.values.map do |subarray|
      subarray.all? { |num| num.even? }
  end.all?
end

p result
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
