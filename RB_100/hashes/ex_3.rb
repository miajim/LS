# Hashes Chapter, Exercise 3
# 7/18/20 

=begin
Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. 
Then write a program that does the same thing except printing the values. 
Finally, write a program that prints both.
=end

family = {
  uncles: ["bob", "joe", "steve"], 
  sisters: ["jane", "jill", "beth"], 
  brothers: ["frank", "rob", "david"], 
  aunts: ["mary", "sally", "susan"]
}


# prints each key as a string
family.each_key { |k| p k.to_s }

# prints each value as provided in the hash (i.e., as an array)
family.each_value { |v| p v }


# prints the keys and values
family.each { |k, v| puts "#{k}: #{v}" }