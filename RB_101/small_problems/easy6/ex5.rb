# RB101-RB109 Small Problems
# Easy 6 - Problem 5: Reversed Arrays (Part 2)
# Thurs. 09/24/20

# PROBLEM STATEMENT
=begin
Write a method that takes an Array, and returns a new Array with the elements
of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you
wrote in the previous exercise.

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true

Further Exploration
An even shorter solution is possible by using either inject or each_with_object.
Just for fun, read about these methods in the Enumerable module documentation,
and try using one in your reverse method.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    -
  Outputs
    -
Rules/Implicit Requirements
  -
Clarifying Questions
  -
Mental Model (optional)
  -

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    -
  Rules
    -

ALGORITHM
  -
=end

# CODE
# initial solution
def reverse(arr)
  index = -1
  new_arr = []
  while index.abs() <= arr.length()
    new_arr << arr[index]
    index -= 1
  end
  new_arr
end

# Refactored
def reverse(arr)
  arr.each_with_object([]){ |elem, new_arr| new_arr.prepend(elem) }
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# Further exploration is my second/refactored solution