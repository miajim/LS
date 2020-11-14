=begin
Example 1 from Watch Others Code: Part 6
Tues. 10/27/20

You're going to be given an array of integers. Your job is to take that array and
find an index N where the sum of the integers to the left of N is equal to the
sum of the integers to the right of N. If there is no index that would make
this happen, return -1.

For example:

Let's say you are given the array [1, 2, 3, 4, 3, 2, 1].
Your method will return the index 3 because at the 3rd position of the array,
the sum of the left side of the index [1, 2, 3] and the sum of the right side
of the index [3, 2, 1] both equal 6.

Another one:

You are given the array [20, 10, -80, 10, 10, 15, 35].
At index 0, the left side is [].
The right side is [10, -80, 10, 10, 15, 35].
They both equal to 0 when added (empty arrays are equal to 0 in this problem).
Index 0 is the place where the left side and right side are equal.

# Notes
Inputs
  - one array with integers as elements
Outputs
  - one integer, represents the index at which the sum of the elements on LHS
    and the sum of the elements on RHS of the returned index are equal
    (note that the element can be included in the sum, but doesn't have to be).
    - Upon further reflection, if we're at index 0 the LHS array is empty, so
      the element at the index should not be included in either sum.
Rules/Req's
  - If there is no index where this is true, return -1
  - All numbers are integers, can be positive or negative
  - Empty arrays are equal to 0
Questions
  -
  -
Algorithm
  - iterate from 0...length of the array
  - generate two subarrays: one that is to the left of the current index
    one that is to the right of the current index
  - find the sum of the LHS array and sum of the RHS array
    - if the sums are equal, return the current index
  - once iteration is complete, return -1 (this assumes that no index was
    found where the sum of the LHS == sum of the RHS)
=end

# Initial Solution
# def find_even_index(arr)
#   (0...arr.size).each do |i|
#     left_arr = arr[0...i]
#     right_arr = arr[(i + 1)..-1]
#     left_arr = [0] if left_arr.empty?
#     right_arr = [0] if right_arr.empty?
#     return i if left_arr.sum == right_arr.sum
#   end
#   -1
# end

# Refactored Solution
def find_even_index(arr)
  (0...arr.size).each do |i|
    left_sum = (i == 0 ? 0 : arr[0...i].sum)
    right_sum = (i == arr.size - 1 ? 0 : arr[(i + 1)..-1].sum)
    return i if left_sum == right_sum
  end
  -1
end


p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

# Andrew's (LS) Solution

# def find_even_index(arr)
#   n = 0
#   loop do
#     if n == 0
#       left_array = []
#     else
#       left_array = arr[0..(n-1)]
#     end

#     right_array = arr[(n+1)..(arr.length - 1)]

#     left_sum = 0
#     right_sum = 0
#     left_sum = left_array.reduce(:+) unless left_array.empty?
#     right_sum = right_array.reduce(:+) unless right_array.empty?

#     if left_sum == right_sum
#       return n
#     else
#       n += 1
#     end
#     break if n == arr.size
#   end
#   -1
# end

