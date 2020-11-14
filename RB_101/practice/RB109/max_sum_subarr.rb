=begin
# Example 1 from Watch Others Code: Part 3
Fri. 10/23/20

The maximum sum subarray problem consists in finding the maximum sum of a
contiguous subsequence in an array of integers:

# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
# Easy case is when the array is made up of only positive numbers and the
max sum is the sum of the whole array. If the array is made up of only negative
numbers, return 0 instead.

# Empty array is considered to have zero greatest sum. Note that the empty
array is also a valid subarray.

# Notes
Inputs
  - one array with integers as elements
    - could be an empty array
    - integers could be 0, positive, or negative
Outputs
  - one integer
    - greatest sum of the subarray
Rules/Req's
  - array of all positive numbers --> max sum = sum of all numbers
  - array of all negative numbers --> max sum = 0
  - empty array is also a valid subarray...
Questions
  - Not sure what it means by the emtpy array is also a valid subarray...
  - Can the subarray be one element in length? e.g., if you had an array of
    all negative numbers, except for one positive element, would the max
    sum be the positive number? --> Assume yes.
  - Should we consider 0 to be a positive number? --> Assume yes.
  - Should we consider 0 to be a negative number? --> Assume yes.
Algorithm
  - Check the input array to see if all numbers are positive or negative
    - if numbers are all positive, return the sum of all numbers in the array
    - if numbers are all negative, return 0
    - if the array is emtpy, return 0
  - Otherwise, generate subarrays from length 1 to length of the input array
    - calculate the sum of the subarray and keep tabs on the max sum
  - After iteration, return the max sum.
=end

# Initial "guard clauses", not really needed...
  # if arr.all? { |num| num >= 0 }
  #   return arr.sum
  # elsif arr.all? { |num| num <= 0 } || arr.empty?
  #   return 0
  # end

# Intial solution
# def max_sequence(arr)
#   max = 0
#   (0...arr.size).each do |start_i|
#     (start_i...arr.size).each do |end_i|
#       current_sum = arr[start_i..end_i].sum
#       max = current_sum if current_sum > max
#     end
#   end
#   max
# end

# Alternative solution
def max_sequence(arr)
  return 0 if (arr.all? { |num| num <= 0 } || arr.empty?)
  (0...arr.size).each_with_object([]) do |start_i, subarrays|
    (start_i...arr.size).each do |end_i|
      subarrays << arr[start_i..end_i].sum
    end
  end.max
end


p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12