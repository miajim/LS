# LS Ruby Challenge Problems
# Easy 1 - Problem 4: Trinary
# Mon. 01/11/2021

=begin
Write a program that will convert a trinary number, represented as a string (e.g. '102012'),
to its decimal equivalent using first principles (without using an existing method or library that can work with numeral systems).

Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary entries should convert to decimal number 0.

The last place in a trinary number is the 1's place. The second to last is the 3's place, the third to last is the 9's place, etc.
=end

=begin
# Notes
Inputs
  - string in base 8
Outputs
  - integer in base 10
Rules/Req's
  - invalid input is octal 0 (i.e., return 0)
  - cannot use built-in methods to convert from octal to base 10
  -
Questions
  - Assuming any input values that start with 0 "ignore" the 0
  -
Algorithm
  - return 0 if the input value is not a integer
    - convert the input string to an integer and back to a string and compare
      this to the original input string
    - if they are the same, then the input is valid, otherwise return 0
  - split the string into characters (i.e., individual integers)
  - convert the array of strings to an array of integers
  - reverse the array and iterate through the elements & their index
    - use the index of the element as the power of 8
      i.e., element * 8 ^ index
  - after iteration, sum the transformed values
=end

# CODE

class Trinary
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 unless valid_trinary?
    num.to_i.digits.map.with_index { |elem, i| elem * 3 ** i }.sum
  end

  private

  def valid_trinary?
    num.chars.none? { |digit| digit =~ /[^0-2]/ }
  end
end

# trinary_num = Trinary.new('011')
# puts trinary_num.to_decimal