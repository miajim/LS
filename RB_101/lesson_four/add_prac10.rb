# RB101-RB109 Lesson 4
# Practice Problems: Additional Practice - Practice Problem 10
# Thurs. 09/10/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

Modify the hash such that each member of the Munster family has an additional "age_group" key
that has one of three values describing the age group the family member is in (kid, adult, or senior).
Your solution should produce the hash below:

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.


=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# get the values of the "outer hash" --> inner hash
# using the age key, determine the range of the age value <-- this can be it's own separate method
# create a new key-value pair where the key is "age_group" and the value is the result of the range
# output the mutated munsters hash

def age_group(num) # assuming num >= 0, which it appears to be from values in the hash
  if (0..17).include?(num)
    "kid"
  elsif (18..64).include?(num)
    "adult"
  else
    "senior"
  end
end


munsters.each_value { |inner_hash| inner_hash["age_group"] = age_group(inner_hash["age"])  }
p munsters

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

=end