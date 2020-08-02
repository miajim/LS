# Arrays Chapter, Exercise 4
# 7/16/20 

arr = [15, 7, 18, 5, 12, 8, 5, 1]

arr.index(5)
# Returns the first index where the argument appears
# Will return 3 in this case

arr.index[5]
# Returns an error, because [] is not a valid argument for the .index method
# Running in irb outputs the following: NoMethodError (undefined method `[]' for #<Enumerator: [15, 7, 18, 5, 12, 8, 5, 1]:index>)

arr[5]
# Returns the element at index 5
# Will return 8 in this case