# RB101-RB109 Small Problems
# Easy 2 - Problem 8: Sum or Product of Consecutive Integers
# Fri. 09/04/20

# PROBLEM STATEMENT
=begin
Write a program that asks the user to enter an integer greater than 0,
then asks if the user wants to determine the sum or product of all numbers
between 1 and the entered integer.

Examples:

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

Further Exploration
The compute_sum and compute_product methods are simple and should be familiar. A more rubyish way of computing sums and products is with the Enumerable#inject method. #inject is a very useful method, but if you've never used it before, it can be difficult to understand.

Take some time to read the documentation for #inject. (Note that all Enumerable methods can be used on Array.) Try to explain how it works to yourself.

Try to use #inject in your solution to this problem.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
Outputs
Rules/Implicit Requirements
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
Inputs
Rules

ALGORITHM
=end

# CODE

def choose_valid_integer
  int = 0
  loop do
    puts ">> Please enter an integer greater than 0: "
    int = gets.chomp
    if (int.to_i.to_s == int) && (int.to_i.positive?)
      break
    else
      puts "That's not a valid input; try again."
    end
  end
  int.to_i
end

def choose_valid_operator
  operation = ''
  loop do
    puts ">> Enter 's' to computer the sum, 'p' to compute the product. "
    operation = gets.chomp.downcase
    if (operation == 's') || (operation == 'p')
      break
    else
      puts "That's not a valid input; try again."
    end
  end
  operation
end

def product(array)
  total = 1
  while array.length > 0
    total *= array.pop
  end
  total
end

def sum(array)
  array.sum
end

int = choose_valid_integer
operation = choose_valid_operator

ary = (1..int).to_a

# if operation.start_with?('s')
#   final_value = sum(ary)
#   operation = 'sum'
# elsif operation.start_with?('p')
#   final_value = product(ary)
#   operation = 'product'
# end

# puts "The #{operation} of the integers between 1 and #{int} is #{final_value}."

# LS Solution Notes

# Further Exploration

if operation.start_with?('s')
  final_value = ary.reduce(:+)
  operation = 'sum'
elsif operation.start_with?('p')
  final_value = ary.reduce(:*)
  operation = 'product'
end

puts "The #{operation} of the integers between 1 and #{int} is #{final_value}."