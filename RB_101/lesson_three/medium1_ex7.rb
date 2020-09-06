# RB101-RB109 Lesson 3
# Practice Problems - Medium 1: Question 7
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
One day Spot was playing with the Munster family's home computer and he wrote
a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
After writing this method, he typed the following...and before Grandpa could
stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)
Did the family's data get ransacked? Why or why not?

=end

# CODE
# Yes, the family's data did get "ransacked". The values method returns an array.
# Each element in the array is a hash and thus when the array is iterated over,
# The "age" and "gender" keys can be used to reassign corresponding values.
# This reassignment changes the values of the subhash and thus mutates the
# main hash (munsters).

# LS Solution
# (same)