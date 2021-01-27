# LS Ruby Challenge Problems
# Easy 1 - Problem 5: Sum of Multiples
# Tues. 01/12/2021

=begin
Write a program that, given a number, can find the sum of all the multiples of
particular numbers up to but not including that number.

If we list all the natural numbers up to but not including 20 that are multiples
of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

Write a program that can find the sum of the multiples of a given set of numbers.
If no set of numbers is given, default to 3 and 5.
=end

=begin
# Notes
Inputs
  - integer that will serve as the maximum / limit of the multiples
Outputs
  - integer that represents the sum of the multiples
Rules/Req's
  - the list of multiples must not include the max/limit
  - if no "starting numbers" are given, then 3 and 5 are the default
  -
Questions
  -
  -
Algorithm
  - generate the multiples from num1...max and num2...max
    - create a range and step through the range by num1 or num2, respectively
  - join the list of multiples and return the unique values
  - sum the list of unique values and return the sum
=end

# CODE
class SumOfMultiples
  def initialize(*nums)
    @nums = (nums.empty? ? [3, 5] : nums)
  end

  def self.to(max_num)
    SumOfMultiples.new.to(max_num)
  end

  def to(max_num)
    @nums.each_with_object([]) do |start_num, multiples|
      (start_num...max_num).step(start_num) { |num| multiples << num }
    end.uniq.sum
  end
end

# sum_obj = SumOfMultiples.new(7, 13, 17)
# p sum_obj.to(20)
# p sum_obj.to(4)
