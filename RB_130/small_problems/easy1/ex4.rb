# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy 1 - Problem 4: Divisors
# Tues. 01/05/2021

=begin
Write a method that returns a list of all of the divisors of the positive
integer passed in as an argument. The return value can be in any sequence you wish.
=end

# def divisors(n)
#   (1..n).select { |num| num if n % num == 0 }
# end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


# Further Exploration
=begin
You may have noticed that the final example took a few seconds, maybe even a
minute or more, to complete. This shouldn't be a surprise as we aren't doing
anything to optimize the algorithm. It's what is commonly called a brute force
algorithm where you try every possible solution; these are easy to write, but
they don't always produce fast results. They aren't necessarily bad solutions
-- it depends on your needs -- but the speed of brute force algorithms should
always be examined.

How fast can you make your solution go? How big of a number can you quickly
reduce to its divisors? Can you make divisors(999962000357) return almost
instantly? (The divisors are [1, 999979, 999983, 999962000357].) Hint: half of
the divisors gives you the other half.
=end

# Option 1
def divisors(n)
  return [1] if n == 1 # band-aid/workaround to n = 1 case
  divisor_arr = []
  num = 1

  loop do
    q, r = n.divmod(num)
    divisor_arr.push(num, q) if r == 0
    num += 1
    break if divisor_arr.include?(num)
  end

  divisor_arr.sort
end

# Option 2
def divisors(n)
  (1..n).each_with_object([]) do |num, arr|
    break arr if arr.include?(num)
    q, r = n.divmod(num)
    arr.push(num, q) if r == 0
  end.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
p divisors(999962000357) == [1, 999979, 999983, 999962000357]

# Alternatively, could use the square root as a way of capping the max (i.e.,
# no need to check past the square root).