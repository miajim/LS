# RB101-RB109 Lesson 3
# Practice Poblems - Easy 1: Question 7
# Thurs. 09/03/2020

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
Make this into an un-nested array.

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones.flatten

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# flintstones.flatten!

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
=begin
Array#flatten also has a destructive method, Array#flatten!
It can also take an optional level argument (int) to determinethe level of
recursion to flatten.

=end
