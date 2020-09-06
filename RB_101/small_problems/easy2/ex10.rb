# RB101-RB109 Small Problems
# Easy 2 - Problem 10: Mutation
# Fri. 09/04/20
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

Further exploration
a) How can this feature of ruby get you in trouble? b) How can you avoid it?

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
Line 11 will return array1 as is
Line 12 will return array1 with Curly, Shemp, and Chico in capital letters
Line 13 will return nil but print the original array1, since these values are stored in array2

Further Exploration
a) You could be make changes to an array (or any other type of data structure)
and unknowingly affect other variable(s) pointing to the same object(s)
b) You can avoid it by not doing this for mutable objects like strings, or
creating a copy of the object that is not attached to the original object and
storing this in a separate data structure.

=end


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# array2 points to the same objects in array1
# any changes to array1 will also be reflected in array2

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes