# RB101-RB109 Small Problems
# Documentation Again - Problem 3: Default Arguments in the Middle
# Mon. 08/24/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
# Consider the following method and a call to that method
require 'pry'
def my_method(a, b = 2, c = 3, d)
    p [a, b, c, d]
end

binding.pry
  
my_method(4, 5, 6)

# Use the ruby documentation to determine what this code will print.

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# Kernel#p
# For each object, directly writes obj.inspect followed by a newline to the program's standard output. 
# Object#inspect // inspect --> string (i.e., returns a string containing a human-readable representation of object)
# my_method(4,5,6) will print (and return) "[4, 5, 6, d]"

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Approach/Algorithm 
# Using "default positional arguments"
# See https://ruby-doc.org/core-2.6.3/doc/syntax/calling_methods_rdoc.html
# Ruby lets you use default args in the middle of a number of positional arguments
# Positional args are filled out first, then the default args are set w/ any values supplied, then defaults values are applied to anything remaining
# Therefore p [a, b, c, d] will print [4,5,3,6]

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# note that p will output the object type (not a string) and will return the object (not nil, like puts and print)