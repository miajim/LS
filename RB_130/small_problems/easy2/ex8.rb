# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy 2 - Problem 8: max_by
# Thurs. 01/07/2021

=begin
The Enumerable#max_by method iterates over the members of a collection, passing
each element to the associated block. It then returns the element for which the block returned the largest value.

Write a method called max_by that behaves similarly for Arrays. It should
take an Array and a block, and return the element that contains the largest value.

If the Array is empty, max_by should return nil.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
for, while, or until to iterate through the Array passed in as an argument, but
must not use any other methods that iterate through an Array or any other collection.

=end

# def max_by(arr)
#   max = nil
#   max_value = nil
#   arr.each do |elem|
#     current_value = yield(elem)
#     max_value ||= current_value
#     max ||= elem
#     if current_value > max_value
#       max = elem
#       max_value = current_value
#     end
#   end
#   max
# end

# clever use of Array#reduce by Rodney
# def max_by(arr)
#   arr.reduce(arr[0]){|start, val| yield(start) < yield(val) ? val : start}
# end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil


# Further Exploration
=begin


=end