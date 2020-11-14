=begin
Codewars - Find All Pairs (7 kyu)
Suggested on Christian Larwood's Study Guide
Thurs. 10/22/20

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)


Inputs
  - array of integers
Outputs
  - one integer
Rules/Req's
  - input array can be empty; if it is empty or contains only one value, return 0
  - count each pair only once, multiple pairs of the same number can exist
  -
Questions
  -
  -
Algorithm
  - create an array of unique values from the input array
  - iterate through the unique values, counting how many of each value exist in
    the input array
  - find thq quotient and remainder of the count for this value / 2
  - store the quotient of each value (this is the number of pairs for that value)
  - sum the stored values to return the total # of pairs
=end

# Initial solution
def pairs(arr)
  arr.uniq.reduce(0) do |sum, num|
    count = arr.count(num)
    num_pairs, _ = count.divmod(2)
    sum + num_pairs
  end
end

# Refactored
def pairs(arr)
  arr.uniq.reduce(0) { |sum, num| sum + arr.count(num).divmod(2)[0] }
end

# Further refactored (after viewing Codewars solutions)
def pairs(arr)
  arr.uniq.reduce(0) { |sum, num| sum + arr.count(num) / 2 }
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0