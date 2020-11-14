=begin
From Srdjan Study Session 10/19/20 via Rona
Mon. 10/19/20

You are given an array which contains only integers (positive and negative).
Your job is to sum only the numbers that are the same and consecutive.
The result should be one array.
You can asume there is never an empty array and there will always be an integer.

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) == [-10,14,12,0]

- input: one array of integers
- ouput: one array of integers (of the same length or shorter than the input arr)
ALGO
- create a new array obj. to store the sums & output
- iterate over the input array
- keep track of the sum of the current iteration
  - sum by default set to the current integer outside the loop
- if the next integer is different than the current integer
  - append the current sum
  - reset the sum to the next integer
- otherwise they are the same integer and we should keep track of the sum
  - add the next integer (or current integer, they are the same) to the sum


- if the next integer is the same as the current integer add to the sum
  - use a throwaway/dummy index within the iteration to determine the "next" number
  - increment index by 1
- otherwise return the current integer (i.e., the sum is the current integer)
- append the sum of the current iteration to a new array
- output the new array after iterating over the entire input array
end
=end

=begin
- iterate through the input array
- create an empty subarray with the current integer
- if the next integer is different that the current integer
  - append the subarray with the current integer to the output array
  - reset the subarr to an empty arr
- otherwise the next integer == current integer
  - append the next integer to the subarray with the current integer
=end

# Option 1

def sum_consecutives(arr)
  results = []
  subarr = []
  arr.each_with_index do |num, i|
    subarr << num if subarr.empty?
    if num != arr[i + 1]
      results << subarr
      subarr = []
    else
      subarr << num
    end
  end
  results.map { |num_groups| num_groups.reduce(:+) }
end

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) == [-10,14,12,0]


# Option 2

def sum_consecutives(arr)
  result = []
  i = 0

  loop do
    same_nums = []
    loop do
      current_num = arr[i]
      next_num = arr[i + 1]
      i += 1
      if current_num == next_num
        same_nums << next_num
      else
        same_nums << current_num
        break
      end
    end
    result << same_nums.sum
    break if i > (arr.length - 1)
  end
  result
end

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) == [-10,14,12,0]

# Rona's Solution
def sum_consecutives(array_of_int)
  current_element = nil
  result_array = []
  array_of_int.each do |num|
    if num == current_element
      result_array[-1] += num
    else
      current_element = num
      result_array << num
    end
  end
  result_array
end

# Other student's solution
def sum_consecutives(array)
  new_array = []
  multiple = 1
  (0..array.size-1).each do |idx|
    if array[idx] == array[idx+1]
      multiple += 1
    else
      sum = multiple * array[idx]
      new_array << sum
      multiple = 1
    end
  end
  new_array
end