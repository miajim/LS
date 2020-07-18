# Arrays Chapter, Exercise 2
# 7/16/20 

# What will the following programs return?
# What is the value of arr after each?


# Program 1
arr = ["b", "a"]
# => ["b", "a"]
arr = arr.product(Array(1..3))
# => arr = [["b", 1] , ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
arr.first.delete(arr.first.last)
# => arr.first.delete(1)
# Returns the last deleted item (1 in this case)
# => arr = [["b"] , ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]


# Program 2
arr = ["b", "a"]
# => ["b", "a"]
arr = arr.product([Array(1..3)])
# => arr = [["b", [1, 2, 3]],["a",[1, 2, 3]]]
arr.first.delete(arr.first.last)
# => arr.first.delete([1,2,3])
# Returns the last deleted item ([1,2,3] in this case)
# => arr = [["b"],["a",[1, 2, 3]]]