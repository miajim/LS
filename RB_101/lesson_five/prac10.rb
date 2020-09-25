# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 9
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
Given the following data structure and without modifying the original array,
use the map method to return a new array identical in structure to the original
but where the value of each integer is incremented by 1.
=end
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution

plus_one = arr.map do |hsh|
  new_hsh = {}
  hsh.map do |key, value|
    new_hsh[key] = (value += 1)
  end
  new_hsh
end

p plus_one

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
identical, execpt uses #each for the inner loop on the hash object
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
