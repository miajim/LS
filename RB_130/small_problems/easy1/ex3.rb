# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy 1 - Problem 3: Find Missing Numbers
# Tues. 01/05/2021

=begin
Write a method that takes a sorted array of integers as an argument, and returns
an array that includes all of the missing integers (in order) between the first
and last elements of the argument.

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

=end

# def missing(arr)
#   (arr[0]...arr[-1]).select { |num| num unless arr.include?(num) }
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []


# Further Exploration
=begin
Can you find other ways to solve this problem? What methods might prove useful?
Can you find a way to solve this without using a method that requires a block?
=end


def missing(arr)
  (arr[0]..arr[-1]).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []