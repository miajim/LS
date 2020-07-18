# Arrays Chapter, Exercise 8
# 7/17/20 
# Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. 
# You should have two arrays at the end of this program, The original array and the new array you've created. 
# Print both arrays to the screen using the p method instead of puts.

# define starting reference array
array = [ 2, 4, 6, 8, 10]

# .map returns the the new array instead of the original array 
new_array = array.map { |num| num + 2 }

# print arrays as-is to screen 
p array
p new_array


