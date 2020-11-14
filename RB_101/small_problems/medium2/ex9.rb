# RB101-RB109 Small Problems
# Medium 2 - Problem 9: Bubble Sort
# Fri. 10/30/20

# PROBLEM STATEMENT
=begin
Bubble Sort is one of the simplest sorting algorithms available. It isn't an
efficient algorithm, but it's a great exercise for student developers.
In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array.
On each pass, each pair of consecutive elements is compared. If the first of
the two elements is greater than the second, then the two elements are swapped.
This process is repeated until a complete pass is made without performing any
swaps; at that point, the Array is completely sorted.

Examples
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - an array with elements (could be integers or strings)
  Outputs
    - the same array (mutated), with the original elements sorted
Rules/Implicit Requirements
  - swap if the first element is greater than the second element
  - if no swap occurred during the first iteration
  -
Clarifying Questions
  -
Mental Model (optional)
  -

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    -
  Rules
    -

ALGORITHM
  - iterate through the input array with index
  - no_swaps = true
  - if the current element > next element
    - swap the current element with the next element (use parallel assignment)
    - no_swaps = false
  - repeat until the penultimate index
  - break the loop if no_swaps == true after iterating through the entire input array
  - return the (mutated) input array
=end

# Initial Solution
# def bubble_sort!(arr)
#   n = arr.size
#   loop do
#     no_swaps = true
#     (0...n - 1).each do |i|
#       if arr[i] > arr[i + 1]
#         arr[i], arr[i + 1] = arr[i + 1], arr[i]
#         no_swaps = false if no_swaps == true
#       end
#     end
#     break if no_swaps == true
#   end
#   arr
# end


# Optimized Solution (see Wikipedia bubble sort)
def bubble_sort!(arr)
  n = arr.size
  loop do
    no_swaps = true
    (0...n - 1).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        no_swaps = false if no_swaps == true
      end
    end
    n -= 1 # optimization
    break if no_swaps == true
  end
  arr # return value of the method doesn't matter, the array passed to the method is still mutated
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)