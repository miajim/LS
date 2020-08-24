# RB101-RB109 Small Problems
# Documentation Again - Problem 6: Keyword Arguments
# Mon. 08/24/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
# What does this code print? 
5.step(to: 10, by: 3) { |value| puts value }

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# Prediction: will not work since the order of the args is incorrect
# Actual Results:
# 5
# 8
# Analysis: Starts at 5, increments by 3 each time until 10 is reached (so won't print 11 because > 10)
# Interesting that the order of to: and by: doesn't matter

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# If you need a method that works with numbers, start with the following classes: Integer, Float, Numeric, Math. 
# Integer and Float inherit from Numeric. 
# Numeric = superclass of all number types
# Math = module that supplies a lot of "number crunching functionality"
# In the signature used here, step takes two keyword arguments (also called named arguments) :by and :to
# Note that keyword argument names are symbols 
# :by is a "step" value (indicates how much to increment the index by each iteration), "to" is a limit (i.e., largest value; if index exceeds this value, loop exits)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# http://ruby-doc.org/core-2.6.3/Numeric.html#step-method
# Invokes the given block with the sequence of numbers starting at num, incremented by step (defaulted to 1) on each call
# Has several signatures, the applicable signature here is: step(by:step, to: limit) {|i| block} --> self 