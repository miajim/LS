=begin
RB101-109 Small Problems - Easy 6
Review
Problem 4: Reversed Arrays (Part 1)

Write a method that takes an Array as an argument, and reverses its elements
in place; that is, mutate the Array passed into this method.
The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:
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

# Notes
Inputs
  - one array with elements
Outputs
  - same array with same elements but w/ elements in backwards order
Rules/Req's
  - cannot use Array#reverse or Array#reverse!
  - must mutate the input array (i.e., input & output array are the same elem.)
  -
Questions
  -
  -
Algorithm
  - iterate through half the elements in the array
  - swap the elements (parallel assign.) at
    - the first and last positions
    - the second and second-to-last positions
  - return the mutated array
=end


# Option 1
def reverse!(arr)
  (0...arr.size / 2).each do |i|
    arr[i], arr[-(i + 1)] = arr[-(i + 1)], arr[i]
  end
  arr
end

# Option 2
def reverse!(arr)
  cp_arr = arr.map { |elem| elem.dup }
  arr.map! { |_| cp_arr.pop }
end
# 0   1  2   3
# -1 -2  -3 -3
# -4   -3 -2 -1

# 0 1 2 3 4

list = [1,2,3,4]
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