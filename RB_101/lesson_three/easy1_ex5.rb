# RB101-RB109 Lesson 3
# Practice Poblems - Easy 1: Question 5
# Thurs. 09/03/2020

=begin
# -------------------------------------------a-------------------------------------------------------------------------------------------------------------------------
# LS Question
Programmatically determine if 42 lies between 10 and 100.

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
p (10..100).include?(42)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
(10..100).cover?(42)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
=begin
Range#include?(obj) --> true or false
Returns true if an obj is an element of the range, false otherwise. If begin and end are numeric,
comparison is done according to the magnitude of the values.
Doesn't seem to work with a range as the obj argument

Range#cover?(obj) --> true or false
Range#cover?(range) --> true or false
Returns true if obj is between the begin and end of range
See more info in docs, can take a range as the argument unlike #include

=end
