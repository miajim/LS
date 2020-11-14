=begin
Sun. 11/1/20
From RB109 Part 2 Study Guide:
Select the element out of the array if its index is a fibonacci number.

# Notes
Inputs
  - one array with elements of any type
Outputs
  - an array with a length equal to or less than the length of the input array
    with elements whose indices are fibonacci numbers
Rules/Req's
  -
  -
  -
Questions
  -
  -
Algorithm
  - create a helper method that returns true if the number passed to the
    method is a fibonacci number (false otherwise)
    - generate the fibonacci sequence, until the last element in the sequence
      is greater than the number passed to the method
    - if the sequence includes the number passed, then it is a fibonacci number
      and the method should return true (return false otherwise)
  - iterate over the input array and select the element if the current index
    is a fibonacci number
  - return the "filtered" array
=end

# 1 1 2 3 5 8 13 21
def fibonacci?(num)
  fib_nums = [1, 1]
  i = 1
  loop do
  # find fib number
    fib_num = fib_nums[i] + fib_nums[i - 1]
    fib_nums << fib_num
    break if fib_num >= num
    i += 1
  end
  fib_nums.include?(num)
end


def fib_index(arr)
  arr.select.with_index { |_, i| fibonacci?(i) }
end

p fibonacci?(1) == true
p fibonacci?(2) == true
p fibonacci?(4) == false
p fibonacci?(21) == true

p fib_index(["hi", "there", "my", "name", "is", "sally"]) == ["there", "my", "name", "sally"]
p fib_index([10, 12, 15, 24, 100, 2, -1, 5, 9, 50]) == [12, 15, 24, 2, 9]