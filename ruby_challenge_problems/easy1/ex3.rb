# LS Ruby Challenge Problems
# Easy 1 - Problem 3: Octal
# Mon. 01/11/2021

=begin
Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output.

Note:

Implement the conversion yourself. Do not use something else to perform the conversion for you. Treat invalid input as octal 0.

About Octal (Base-8):

Decimal is a base-10 system.

A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

The rightmost digit gets multiplied by 100 = 1
The next number gets multiplied by 101 = 10
...
The n*th number gets multiplied by 10n-1*.
All these values are summed.

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

class Octal
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 unless valid_octal?
    num.to_i.digits.map.with_index { |elem, i| elem * 8 ** i }.sum
  end

  private

  def valid_octal?
    return false if num.chars.any? { |char| char != char.to_i.to_s }
    num.to_i.digits.all? { |digit| digit < 8 && digit >= 0 }
  end
end

octal_num = Octal.new('011')
puts octal_num.to_decimal