# Arrays Chapter, Exercise 1
# 7/16/20 

# Below we have given you an array and a number.
# Write a program that checks to see if the number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

# arr.each { |x|
#   if x == number
#     puts "true"
#   else
#   end
# }

# could also use the Ruby method .include?()
puts arr.include?(number)