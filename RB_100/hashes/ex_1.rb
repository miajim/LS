# Hashes Chapter, Exercise 1
# 7/18/20 

# Given a hash of family members, with keys as the title and an array of names as the values, 
# use Ruby's built-in select method to gather only immediate family members' names into a new array.

# Given
family = {
  uncles: ["bob", "joe", "steve"], 
  sisters: ["jane", "jill", "beth"], 
  brothers: ["frank", "rob", "david"], 
  aunts: ["mary", "sally", "susan"]
}

immediate_family = family.select { |k| k == :brothers || k == :sisters }
p immediate_family.values.to_a.flatten

# Note that .to_a is not necessary, since the .values method returns the hash values as an array!