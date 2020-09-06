# RB101-RB109 Lesson 3
# Practice Problems - Medium 2: Question 3
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
Let's call a method, and pass both a string and an array as parameters and
see how even though they are treated in the same way by Ruby, the results can be different.

Study the following code and state what will be displayed...and why:
=end

def tricky_method(a_string_param, an_array_param)
  # This will modifiy the a_string_param within the method but not affect the
  # my_string variable because even though strings are mutable, the
  # reassignment (+=) variable will create a new object and not override the
  # original object.
  a_string_param += "rutabaga"
  # This will mutate the array and add the string as the second element in
  # my_array.
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "pumpkins"
puts "My array looks like this now: #{my_array}" # [pumpkins, "rutabaga"]

# CODE
# See my comments

# LS Solution
# Similar, see answer key