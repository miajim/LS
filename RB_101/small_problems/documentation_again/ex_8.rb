# RB101-RB109 Small Problems
# Documentation Again - Problem 8: Included Modules
# DATE 08/24/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
# Follow along with Ruby docs for v2.3.0 
# Use irb to run the following code: 
a = [5, 9, 3, 11]
puts a.min
# Find the documentation for the #min method and change the above code to print the two smallest values in the Array. 
# A solution that uses the #min method alone requires v2.2.0 or higher of Ruby 

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# http://ruby-doc.org/core-2.6.3/Array.html#min-method
# signature: min(n) --> array
a.min(2)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Written w.r.t Ruby 2.3.0
# Multiple inheritance (MI): allows a class to inherit from two or more immediate superclasses. Ruby does NOT allow this!
# Ruby has an alternative called mix-in modules. They provide a way for classes of different types to share behaviors w/o using inheritance. 
# Enumerable module (common mix-in)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
