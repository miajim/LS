# RB101-RB109 Small Problems
# Easy 6 - Problem 4: Reversed Arrays (Part 1)
# Wed. 09/23/20

# PROBLEM STATEMENT
=begin
Write a method that takes an Array as an argument, and reverses its elements in
place; that is, mutate the Array passed into this method.
The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

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
  - iterate over the input array
  - take the first element in the array and append it to the original array
  - do this for the length of the original array minus 1
    - the last item of the original array will become the first item in the
    - reversed array when the penultimate item of the original array is
    - appended to the reversed array
=end

# CODE

def reverse!(arr)
  index = arr.length - 1
  while index >= 1
    arr << arr[index-1]
    arr.delete_at(index-1)
    index -= 1
  end
  arr
end

list = [1,2,3,4]
reverse!(list)
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []