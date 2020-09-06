# RB101-RB109 Lesson 3
# Practice Poblems - Easy 2: Question 1
# Friday. 09/04/2020

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
see if "Spot" is present.

Bonus: What are two other hash methods that would work just as well for this solution?

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.key?("Spot") # Should return false since "Spot" is not present in the Hash
# Bonus
p ages.include?("Spot")
p ages.fetch("Spot", "Spot is not present as a key in the hash.")

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Hash#include?
# Hash#member?

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# Both of the additional LS solutions appear to be aliases for #key?
# Note that #include? and #member? do not test member equality using ==