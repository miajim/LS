# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 7
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
Given this code, what would be the final values of a and b? Try to work this out without running the code.
=end
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a, b
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# a = 4
# b = [1, 8]

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
The value of a doesn't change because a is not being referenced (+= modifies the array, not a).
The value of b changes since b is an array and it is modified by assigning a new value at index 0.
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
