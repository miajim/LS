# RB101-RB109 Small Problems
# Documentation Again - Problem 2: Optional Arguments Redux
# Mon. 8/24/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question

# Assume you have the following code: 
require 'date'

puts Date.new
puts Date.new(2016)
puts Date.new(2016, 5)
puts Date.new(2016,5, 13)

# What will each of the 4 puts statements print?

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# Date.new prints an argument error
# Date.new(2016) prints 2016-01-01
# Date.new(2016, 5) prints 2016-01-05
# Date.new(2015, 5, 13) prints 2016-05-13

# After running file
# Date.new prints -4712-01-01
# Date.new(2016) prints 2016-01-01
# Date.new(2016, 5) prints 2016-05-01
# Date.new(2016, 5, 13) prints 2016-05-13

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Date class --> Standard library API documentation
# new([year=-4712[,month-1[,mday=1[,start=Date::ITALY]]]) --> date
# [] denotes all of the arguments are optional 
# Brackets [] are nested, outermost bracket pairs can only be ommitted if all the innermost bracket pairs are ommitted as well 



# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# require method (Kernel module): loads the given name, returning true if successful and false if the feature is already loaded 
# Date: a subclass of object that includes the Comparable module and easily handles date. 
# All date objects are immutable; hence cannot modify themselves. 
# Date::new creates a date object denoting the given ordinal date
# The ordinal date is a particular day of a calendar year identified by its ordinal number within the year (1-366)
# The Julian day number is in elapsed days since noon on January 1, 4713 BCE.