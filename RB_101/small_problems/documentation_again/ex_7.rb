# RB101-RB109 Small Problems
# Documentation Again - Problem 7: Parent Class
# Mon. 08/24/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
# Use irb to run the following code: 
s = 'abc'
# puts s.public_methods.inspect

# You should find that it prints a list of all of the public methods available to the String s; 
# this includes not only those methods defined in the String class, but also methods that are inherited from Object
# (which inherits other methods from the BasicObject class and the Kernel module). That's a lot of methods.

# How would you modify this code to print just the public methods that are defined or overridden by the String class? 
# That is, the list should exclude all members that are only defined in Object, BasicObject, and Kernel.

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# Prediction: There is a private_methods method that will print only the methods available to the String class. 
# Actual/Analysis: 
# Started by searching public_methods, found in the Object Class
# Signature: public_methods(all=true) --> array
# "Returns the list of public methods accessible to obj. If the all parameter is set to false, only those methods in the receiver will be listed."
# Recall that Array#inspect creates a string representation of self. 
puts s.public_methods(false).inspect
# puts s.private_methods.inspect
# I think private methods may be different, need to review OOP

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Look at the documentation for the class before looking at the superclass documentation (in case the superclass documentation is overridden by the class)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# http://ruby-doc.org/core-2.6.3/Object.html#public_methods-method