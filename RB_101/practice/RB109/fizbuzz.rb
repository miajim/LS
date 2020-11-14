# Example 2 from Live Session: Beginning Ruby Part 4
# Mon. 10/19/20

=begin
  Write a method that takes two arguments: the first is the starting number,
  and the second is the ending number. Print out all numbers between the two
  numbers, except if a number is divisible by 3, print "Fizz", if a number is
  divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5,
  print "FizzBuzz".
=end

# **input**
# fizzbuzz(1, 15)

# **output
# 1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"


=begin
P
- input: two integers
- ouput: a combination of integers and strings, number of elements = (num 2 - num 1) + 1
E
see test case above
D
input: local vars
output: array, output as shown above (elements separated by commas and spaces)
A
- generate an array of numbers starting at num1 and ending at num2
- iterate through the array determining if the element is a multiple of 3, 5, or both
  - multiple of 3 => "Fizz"
    > num % 3 == 0
  - multiple of 5 => "Buzz"
    > num % 5 == 0
  - multiple of both => "FizzBuzz"
    > num % 15 == 0
  - multiple of neither => integer at that iteration
    > else num
- save the return value (string or integer) on each iteration
- output the saved values upon ending iteration

C
=end


def fizzbuzz(start_num, end_num)
  arr = (start_num..end_num).to_a
  arr.map! do |num|
    if num % 15 == 0
      "FizzBuzz"
    elsif num % 3 == 0
      "Fizz"
    elsif num % 5 == 0
      "Buzz"
    else
      num
    end
  end
  puts arr.join(", ")
end

fizzbuzz(1, 15)