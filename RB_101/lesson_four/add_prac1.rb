# RB101-RB109 Lesson 4
# Practice Problems: Additional Practice - Practice Problem 1
# Thurs. 09/10/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question

Given the array below:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

Turn this array into a hash where the names are the keys and the values
are the positions in the array.

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# option 1
hash1 = flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name)
end

p hash1

# option 2
hash2 = {}
flintstones.each_with_index() do |name, i|
  hash2[name] = i
end

p hash2
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

=end