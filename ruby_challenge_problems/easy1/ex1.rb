# LS Ruby Challenge Problems
# Easy 1 - Problem 1: Series
# Sun. 01/10/2021

=begin
Write a program that will take a string of digits and give you all the possible
consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:
- 012
- 123
- 234

And the following 4-digit series:
- 0123
- 1234

=end


=begin
ALGO
- split the string into an array of integers
- iterate over the integers array
  - return a slice of the array, starting at i = 0, for a length of n
- stop iterating once i > (array length - n)
=end

class Series
  def initialize(number)
    @number = number
  end

  def slices(n)
    raise ArgumentError if n > @number.size
    i = 0
    slices = []
    arr = @number.split("").map(&:to_i)

    while i <= (arr.size - n)
      slices << arr[i, n]
      i += 1
    end

    slices
  end
end


# series = Series.new('01234')
# p series.slices(6)