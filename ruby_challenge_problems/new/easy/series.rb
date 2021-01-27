# LS Ruby Challenge Problems (New)
# Easy - Problem 10: Series
# Mon. 01/25/2021

=begin
Write a program that will take a string of digits and return all the possible
consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

012
123
234
Likewise, here are the 4-digit series:

0123
1234
Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.
=end

=begin
# Notes
Inputs
  - string with digits
Outputs
  - array with strings
Rules/Req's
  - substrings must be at specified length
  - if the length of the substring exceeds the length of the base string,
    through an ArgumentError
  -
Questions
  -
  -
Algorithm
  - define a class called Series with #initialize(str) and #slices(num)
  - #initialize(str)
    - set an instance variable to the passed string
  - #slices(num)
    - guard clause: raise ArgumentErrror if num > str.size
    - iterate over the length of the string minus substring length
      - i.e., (0...(str.size - n))
    - append the substrings to an array
      - substrings go from starting idx for a length of num
    - output the array of strings
=end

# CODE

class Series
  def initialize(str)
    @str = str.split("").map(&:to_i)
  end

  def slices(len)
    raise ArgumentError.new if len > @str.size
    (0..(@str.size - len)).each_with_object([]) do |i, arr|
      arr << @str[i, len]
    end
  end
end