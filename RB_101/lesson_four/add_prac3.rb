# RB101-RB109 Lesson 4
# Practice Problems: Additional Practice - Practice Problem 3
# Thurs. 09/10/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
remove people with age 100 and greater.

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# Option 1
p ages.reject { |keys, values| values >= 100 } # returns a new hash

# Option 2
younger_than_100, older_than_100 = ages.partition { |keys, values| values < 100 }
p younger_than_100.flatten # returns a new array


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
p ages.keep_if { |_, age| age < 100 } # returns a hash
# #select! is equivalent to #keep_if, but returns nil if no changes were made
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.select { |name, age| age < 100 }

=begin

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# keep_if deletes every key-value pair from hsh for which block evalutates to false
# it is a destructive method.
# #filter! is an alias for #select!

=end