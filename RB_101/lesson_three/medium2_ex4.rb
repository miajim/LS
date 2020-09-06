# RB101-RB109 Lesson 3
# Practice Problems - Medium 2: Question 4
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
To drive that last one home...let's turn the tables and have the string show
a modified output, while the array thwarts the method's efforts to modify
the caller's version of it.
=end

def tricky_method_two(a_string_param, an_array_param)
  # the string object pointed to by my_string and a_string_param is mutated
  a_string_param << 'rutabaga'
  # the object pointed to by my_array remains the same, while an_array_param
  # now points to a new object
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "pumpkinsrutabaga"
puts "My array looks like this now: #{my_array}" # ["pumpkins"]

# CODE
# See my comments

# LS Solution
# Similar, see answer key