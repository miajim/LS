# RB101-RB109 Lesson 4
# Practice Problems: Additional Practice - Practice Problem 8
# Thurs. 09/10/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
What happens when we modify an array while we are iterating over it?
What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

This code would output 1, then shift the array to be [2, 3, 4]
The each method would then be at index 1, which is now 3, so print 3
Shift the array to be [3, 4]
THe each method index is 2, but this no longer exists, so the each loop is done
The original array has been mutated, and is now [3, 4] so each returns [3, 4]
The output to the screen from iterating is 1, 3

What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

output 1
pop [1, 2, 3]
output 2
pop [1, 2]
array returned from #each --> [1, 2]
output to screen: 1, 2

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# see above

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes

=begin

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

=end