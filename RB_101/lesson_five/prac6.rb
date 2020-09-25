# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 6
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member,
...like this:
(Name) is a (age)-year-old (male or female).

=end
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# Algorithm

# Code
munsters.each { |name, info| puts "#{name} is a #{info["age"]}-year-old #{info["gender"]}."}

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
Almost identical, uses Hash#each_pair instead of #each
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# Hash#each_pair appears to be an alias for Hash#each
# Makes it a little easier to understand what is going on.