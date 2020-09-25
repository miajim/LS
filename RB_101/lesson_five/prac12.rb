# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 12
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
Given the following data structure, and without using the Array#to_h method,
write some code that will return a hash where the key is the first item in
each sub array and the value is the second item.
=end
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
hsh = Hash.new
arr.each do |subarray|
  hsh[subarray[0]] = subarray[1]
end
p hsh

# Slightly refactored
p arr.each_with_object({}) { |subarray, hsh| hsh[subarray[0]] = subarray[1] }
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
