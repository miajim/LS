# RB101-RB109 Lesson 3
# Practice Poblems - Easy 1: Question 8
# Thurs. 09/03/2020

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
Turn this into an array containing only two elements: Barney's name and Barney's number.
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.delete_if {|key, value| value != 2}.flatten

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# flintstones.assoc("Barney")
#=> ["Barney", 2]

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
=begin
Hash#assoc(obj) --> an_array or nil
Searches through the hash comparing obj with the key using ==.
Returns the key-value pair (two elements array) or nil if no match is found.

=end
