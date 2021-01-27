# LS Ruby Challenge Problems
# Easy 1 - Problem 2: Sieve of Eratosthenes
# Mon. 01/11/2021

=begin
Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.

The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit.
It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.

Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit]).

The algorithm consists of repeating the following over and over:

- take the next available unmarked number in your list (it is prime)
- mark all the multiples of that number (they are not prime)

Repeat until you have processed each number in your range. When the algorithm terminates,
all the numbers in the list that have not been marked are prime. The wikipedia article has a useful graphic that explains the algorithm.

Notice that this is a very specific algorithm, and the tests don't check that you've implemented the algorithm,
only that you've come up with the correct list of primes.

=end


=begin
# Notes
Inputs
  - integer, representing the ending number in the range
Outputs
  - array of integers, representing the prime numbers in the range
Rules/Req's
  - range starts at 2 and ends at the given limit (2..limit)
  -
  -
Questions
  -
  -
Algorithm
  - use a hash to keep track of numbers that have been marked/unmarked
    - keys: integers from 2..limit
    - values: either true or false
    - starting key-value pairs will be integers from 2..limit with values of true
    (assume all prime/"unmarked")
  - iterate through the hash
    - find the first unmarked key and generate all the multiples from that num to n
      and set the values to false
      - i.e., num * (1..(n/num)) => false
  - after iteration, select the keys with "true" values; these are the prime #s
=end

# CODE (elapsed time => 0.000463175)
# class Sieve
#   attr_reader :limit
#   def initialize(limit)
#     @limit = limit
#   end

#   def primes
#     hsh = (2..limit).each_with_object({}) { |k, hsh| hsh[k] = true }
#     hsh.each_pair do |key, value|
#       next unless value == true
#       first_multiple = key ** 2
#       last_multiple = key * (limit / key)
#       (first_multiple..last_multiple).step(key) { |k| hsh[k] = false }
#     end
#     hsh.select { |_, v| v == true }.keys
#   end
# end

# LS Solution 1 (elapsed time => 0.00254596)
# class Sieve
#   attr_reader :range

#   def initialize(last_num)
#     @range = (2..last_num).to_a
#   end

#   def primes
#     range.each do |prime|
#       range.reject! { |num| (num != prime) && (num % prime == 0) }
#     end
#     range
#   end

# end

sieve = Sieve.new(1000)
# start_time = Time.now
sieve.primes
# end_time = Time.now
# elapsed_time = end_time - start_time
# p elapsed_time # => 0.000463175