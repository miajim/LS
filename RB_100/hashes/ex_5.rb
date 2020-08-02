# Hashes Chapter, Exercise 5
# 7/18/20 

# What method could you use to find out if a Hash contains a specific value in it? 
# Write a program to demonstrate this use.
family = {
  uncles: ["bob", "joe", "steve"], 
  sisters: ["jane", "jill", "beth"], 
  brothers: ["frank", "rob", "david"], 
  aunts: ["mary", "sally", "susan"]
}


puts family.has_value?(["frank", "rob", "david"])
# => returns true

puts family.has_value?("rob")
# => returns false 