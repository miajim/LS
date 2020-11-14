=begin
# Example 1 from Watch Others Code: Part 2
Thurs. 10/22/20

You have to create a method that takes a positive integer number and returns
the next bigger number formed by the same digits:

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no bigger number can be composed using those digits, return -1:

# 9 ==> -1
# 111 => -1
# 531 ==> -1


# Notes
Inputs
  - one integer
Outputs
  - one integer, next larger number using the same digits
Rules/Req's
  - return -1 if it is not possible to form a bigger number
  - input integer is positive (i.e., > 0)
  -
Questions
  -
  -
Algorithm
  - obtain the digits of the input integer
  - create & save all possible combinations of the digits
    - the first element in the combos array should be the original input number
    - then you want to shuffle the order (number of digits - 1) times
    - to shuffle the order you want to take the first element of the digits array
      and append it to the end
  - sort the array of all possible combinations from smallest to largest
  - obtain the index of the input number
  - add 1 to the index to obtain the next largest number
  - return the number if it exists, otherwise return -1
=end

# Initial Solution
# def next_bigger_num(num)
#   digits = num.digits.reverse
#   return -1 if digits.size == 1

#   -1.downto(-digits.size+1) do |i|
#     temp_arr = digits.map { |digit| digit.dup }
#     temp_arr[i-1], temp_arr[i] = temp_arr[i], temp_arr[i-1]
#     new_num = temp_arr.join.to_i
#     return new_num if new_num > num
#   end # implicit return value of -1
# end


# =begin
# Refactored Algorithm
# - get the digits of the input number
# - sort the digits from highest to lowest and store as the max
# - iterate from the input number to the max
# - if the current number sorted == the input number sorted then return the current number
# - otherwise return - 1 once iteration is complete
# =end

# Refactored Solution
def next_bigger_num(num)
  return -1 if num < 12
  digits = num.digits.reverse
  max = digits.sort { |a, b| b <=> a }.join.to_i
  (num + 1..max).each do |current_num|
    return current_num if (current_num.digits.sort == digits.sort)
  end
  -1
end


# Dana's (LS) Solution
# def max_num(input)
#   input.to_s.chars.sort.reverse.join.to_i
# end

# def next_bigger_num(input)
#   max = max_num(input)
#   (input + 1..max).each do |num|
#     return num if max == max_num(num)
#   end
#   -1
# end

# LS test cases
p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798

# my additional test cases
p next_bigger_num(2071) == 2107
p next_bigger_num(5642) == 6245

