# Loops & Iterators Chapter, Exercise 1
# 7/14/20 
# What does the each method in the following program return after it is finished executing?

x = [1, 2, 3, 4, 5]

x.each do |a|
  a + 1
end

# The .each method when executed will return the original array that it was passed. 

