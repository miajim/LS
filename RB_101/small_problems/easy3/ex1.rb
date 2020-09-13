# RB101-RB109 Small Problems
# Easy 3 - Problem 1: Searching 101
# Sun. 09/06/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Searching 101
Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

Examples:

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
num_set = []
positions = ["1st", "2nd", "3rd", "4th", "5th", "last"]

while positions.length > 1
  puts "==> Enter the #{positions.shift} number: "
  num = gets.chomp.to_i
  num_set << num
end

puts "==> Enter the #{positions.last} number: "
last_num = gets.chomp.to_i
puts num_set.include?(last_num) ? ("The number #{last_num} appears in #{num_set}.") : ("The number #{last_num} does not appear in #{num_set}.")

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes