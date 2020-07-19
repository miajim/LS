# Exercises Chapter, Exercise 2
# 7/19/20 

# Same as above (exercise 1), but only print out values greater than 5

# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each do |num|
#   if num > 5
#     puts num
#   end
# end

# Refactored
puts arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select { |num| num > 5 }