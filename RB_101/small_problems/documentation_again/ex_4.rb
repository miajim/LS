# RB101-RB109 Small Problems
# Documentation Again - Problem 4: Mandatory Blocks
# Mon. 08/24/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
# The Array#bsearch method is used to search ordered Arrays more quickly than #find and #select can. Assume you have the following code: 
a = [1, 4, 8, 11, 15,19]

# How would you search the Array to find the first element whose value exceeds 8? 

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# http://ruby-doc.org/core-2.6.3/Array.html#bsearch-method
# using the find-min mode in this case 
p a.bsearch {|x| x>8}

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# This signature shows that #bsearch takes only one argument - a block - and returns an element of the Array to which it is applied. 
# We can also see that the block is required, and that it takes one argument. 
# The text and examples below the signature tell and show us that the block must return true or false when operating in what is called "find-minimum mode", which is the usual use case.
# See https://en.wikipedia.org/wiki/Binary_search_algorithm for more info on the algorithm

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# bsearch = binary search, finds a value from this array which meets the given condition in O(log n) where n is the size of the array
# signature: bsearch{|x| block} --> elem
# !!!The array must be sorted first to be applicable!!!
# Can use in 2 modes: find-minimum or find-any 
# In find-min mode, the block must always return true or false, and there must be an index i (0 <= i <= ary.size) s.t.:
# the block returns false for any element whose index is less than i and 
# the block returns true for any element whose index is greater than or equal to i 