=begin
From Srdjan-led study session on 10/19/20, shared with me by Rona

You are given an array which contains only integers (positive and negative).
Your job is to sum only the numbers that are the same and consecutive.
The result should be one array.
You can asume there is never an empty array and there will always be an integer.

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) == [-10,14,12,0]

# Notes
Inputs
  - one array w/ integers (can be pos or neg)
Outputs
  - one array w/ integers (can be pos or neg)
Rules/Req's
  - sum only numbers that are exactly the same and consecutive elements in the
    array
  - the input array will always have at least one integer
    e.g., sum_consecutives([num]) = [num]
  -
Questions
  -
  -
Algorithm
  - start with the first element in the input array in a collection array
  - iterate through the input array from index 1..-1
  - append the first number in the array to a new array collecting the sum
    of same, consecutive integers & go to the next number in the array
  - if the next number is the same as the last number in the collection array,
    replace the last number in this array with the last number + current number
  - otherwise append the current number to the collection array

=end

=begin
UPDATED ALGORITHM
  - create an array (result) to keep track of the sum of same, consecutive nums
  - create a variable to keep track of the moving index (index changes if
    current number is not the same as the previous number)
  - iterate through the input array
  - if the current element (num) is equal to the previous element, then
    add the current num to the last num in the result array
  - otherwise append the current num to the result array and update the
    index to the current index (index of the current num) so that the next
    element can be compared to the element at this index
  - return the result array
=end


def sum_consecutives(arr)
  result = [0]
  current_index = 0

  arr.each_with_index do |num, i|
    if num == arr[current_index]
      result[-1] += num
    else
      result << num
      current_index = i
    end
  end

  result
end

def sum_consecutives(arr)
  result = []
  current_elem = nil

  arr.each_with_index do |num, i|
    if num == current_elem
      result[-1] += num
    else
      result << num
      current_elem = num
    end
  end

  result
end

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) == [-10,14,12,0]
p sum_consecutives([1]) == [1]
