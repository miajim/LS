# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy 2 - Problem 2: Zipper
# Thurs. 01/07/2021

=begin
The Array#zip method takes two arrays, and combines them into a single array
in which each element is a two-element array where the first element is a value
from one array, and the second element is a value from the second array, in order.
For example: [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

Write your own version of zip that does the same type of operation.
It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed).
Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.

Example:
zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

=end
def zip(arr1, arr2)
  (0...arr1.size).map { |i| [arr1[i], arr2[i]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Further Exploration
=begin

=end