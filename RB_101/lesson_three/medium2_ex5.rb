# RB101-RB109 Lesson 3
# Practice Problems - Medium 2: Question 5
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
Depending on a method to modify its arguments can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

Whether the above "coincidentally" does what we think we wanted "depends"
upon what is going on inside the method.

How can we refactor this practice problem to make the result easier to predict
and easier for the next programmer to maintain?
=end

# CODE
# change the method name to something that is indicative of what the method does
# change the array to modify the string as well
# add a third argument that indicates the object being appended
def append_string(a_string_param, an_array_param, string_to_append)
  a_string_param << string_to_append
  an_array_param << string_to_append
end

my_string = "pumpkins"
my_array = ["pumpkins"]
# store the string to be appended in an outer (local) variable
add_string = "rutabaga"

# Output the results of the string and array before and after for easy comparison
puts "My string looked like this before: #{my_string}"
puts "My array looked like this before: #{my_array}"

append_string(my_string, my_array, add_string)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# LS Solution
def not_so_tricky_method(a_string_param, an_array_param)
  # Don't mutate the original outer variables
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  # return both objects stored in the variables local to the method
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
# override the original string and array by reassignment
# (i.e., store both objects returned by the method in the original variable names)
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"