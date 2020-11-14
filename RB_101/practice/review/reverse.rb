=begin
Sun. 11/1/20
From RB109 Part 2 Study Guide:
Reverse an array without using the built-in reverse method.
(Same as Reversed Arrays (Part 2) from RB101-109 Small Problems (Easy 6, Problem 5))


# Notes
Inputs
  - one array with elements
Outputs
  - one new array with the elements in the opposite order
Rules/Req's
  - cannot use the built-in reverse method
  - assuming this is a non-destructive operation
  -
Questions
  -
  -
Algorithm
  - iterate over the current array
  - for each element in the new array:
    - place the element starting at index -1, working backwards
  - return the new array
=end

def reverse(arr)
  arr.map.with_index { |elem, i| arr[-(i + 1)] }
end

# def reverse(arr)
#   reversed_arr = []
#   -1.downto(-arr.size) do |i|
#     reversed_arr << arr[i]
#   end
#   reversed_arr
# end

# def reverse(arr)
#   reversed_arr =[]
#   (arr.size).times { |_| reversed_arr << arr.pop }
#   reversed_arr
# end


# arr = [1, 2, 3, 4, 5]
# p reverse(arr) == [5, 4, 3, 2, 1]

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true