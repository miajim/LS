# Example 3 from Live Session: Beginning Ruby Part 5
# Tues. 10/20/20

=begin
Write a method that takes two numbers. It should print out all the primes
between the two numbers. Don't use Ruby's prime class.

p find_primes(3, 10)  # => 3, 5, 7

ALGO
- a number is prime if it's only divisible by itself and one.
  - num % 2, % 3, %4, %5, ...%9 != 0 unless the number is equal to the divisor
- create an array constant with digits 2..9
- iterate through the array constant
- if the input number is not equal to the current digit and input num % current digit != 0
  - then the number is prime, otherwise it's not prime

- create an array of numbers starting at the first input number and ending at
the last input number
- iterate through the array checking if each number is prime
- store the number only if the number is prime
- print out the stored (prime) numbers
=end

# DIVISORS = (2..9).to_a

# def prime?(int)
#   not_prime = DIVISORS.any? do |digit|
#     if int == digit
#       next
#     else
#       (int % digit) == 0
#     end
#   end
#   !not_prime
# end

# # don't have to convert range to array, because Range class includes the
# # Enumerable module
# def find_primes(start_num, end_num)
#   (start_num..end_num).select { |num| prime?(num) }.join(", ")
# end



# Conrad's (LS) Solution
# def is_prime?(number)
#   (2..(number-1)).each do |divisor|
#     return false if number % divisor == 0
#   end
#   true
# end

def is_prime?(num)
  !(2...num).any? { |divisor| num % divisor == 0 }
end

def find_primes(start, stop)
  (start..stop).select do |number|
    is_prime?(number)
  end
end


puts find_primes(3, 10) # => 3, 5, 7
puts find_primes(5, 20) # => 5, 7, 11, 13, 17, 19
puts find_primes(1, 2) # => 1, 2