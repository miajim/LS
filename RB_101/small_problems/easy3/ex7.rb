# RB101-RB109 Small Problems
# Easy 3 - Problem 7: Odd Lists
# Wed. 09/09/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

Examples:

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

Further Exploration
Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
Try to solve this exercise in at least 2 additional ways.

=end


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
def oddities(arr)
  odd_arr = []
  arr.each_index {|i| odd_arr << arr[i] if i.even? }
  odd_arr
end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []

# Further Exploration
# option 1
def oddities(arr)
  odd_arr = []
  # Enumerable#each_with_index
  arr.each_with_index {|elem, i| odd_arr << elem if i.odd? }
  odd_arr
end

# option 2
def oddities(arr)
  # Enumerator#with_index
  arr.map.with_index {|elem, i| elem if i.odd?}.compact
end

p oddities([2, 3, 4, 5, 6]) == [3, 5]
p oddities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['def']
p oddities([123]) == []
p oddities([]) == []

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# uses a while loop to append elements at even indices to a new collection array
# increments the index counter s.t. only even numbers are generated

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
