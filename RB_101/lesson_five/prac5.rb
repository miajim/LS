# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 5
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
Given this nested Hash, figure out the total age of just the male members of the family.
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
# select members (e.g., Herman, Lily, etc.) within the main hash whose sub-hash
# has the value "male" for their "gender" key
# for these key-value pairs, sum the corresponding values to the "age" key within
# their sub-hash

# Code
males = munsters.values.select do |subhash|
  subhash["gender"] == "male"
end

total_age = 0
males.each { |subhash| total_age += subhash["age"] }
p total_age

# Refactored
p munsters.values.select { |subhash| subhash["gender"] == "male" }.reduce(0) { |sum, subhash| sum + subhash["age"] }

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
Uses Hash#each_value and an external counter to keep track of the total sum
More efficient, because it only uses one loop

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
