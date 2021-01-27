# LS Ruby Challenge Problems (New)
# Easy - Problem 3: Roman Numerals
# Sat. 01/23/2021

=begin
The Romans were a clever bunch. They conquered most of Europe and ruled it for
hundreds of years. They invented concrete and straight roads and even bikinis.
One thing they never discovered though was the number zero. This made writing and
dating extensive histories of their exploits slightly more challenging, but the
system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these
letters have lots of straight lines and are hence easy to hack into stone tablets.

 1  => I
10  => X
 7  => VII

There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately
starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:
1000=M
900=CM
90=XC

2008 is written as MMVIII:
2000=MM
8=VIII

# Notes on Roman Numberals
- Placing any smaller # in front of a larger # indicates subtraction
- I = 1
- V = 5
- X = 10
- L = 50
- C = 100
- D = 500
- M = 1000

  I, II, III
  IV, V, VI, VII, VIII
  IX, X, XX, XXX
  XL, L, LX, LXX, LXXX
  XC, C, CC, CCC,
  CD, D, DC, DCC, DCCC, CM, M
=end
NUMERALS = {
  0 => ['I', 'V', 'X'],
  1 => ['V', 'L', 'C']
}

=begin
# Notes
Inputs
  - integer
Outputs
  - string representing the integer in roman numerals
Rules/Req's
  - placing any small number in front of a larger # indicates subtraction
  - all inputs will be valid (min: 1 - max: 3000)
Questions
  -
  -
Algorithm
  - create a class called Roman Numeral with #initialize and #to_roman
  - define a hash constant that matches an index number to an array of two
    roman numerals as strings
  - #initialize
    - takes an integer as an argument and stores in instance variable
  - #to_roman
    - converts the calling object (integer) to a roman numeral as a string
    - obtain the digits of the integer e.g., 1024 => 4, 2, 0, 1
    - if the digit is 4 or 9, use roman numeral subtraction, otherwise use the
      corresponding letter n times (1..3)
        - if the digit is between 1 and 3
          - use the corresponding numeral 1..3 times
        - if the digit is between 5 and 8
          - use the corresponding roman numeral and concatenate the previous
            roman numeral 1..3 times
    - calculate the expanded form using each integer
      - e.g., 4 * 10^0 = 4, 2 * 10^1 = 20, 0 * 10^2 = 0, 1*10^3 = 1000


- define a hash constant with ranges as keys and arrays as values
  - keys: (1..10), (10..100), (100..1000)
  - values: ['I', 'V', 'X'], ['X', 'L', 'C'], ['C', 'D', 'M']
- create a local variable to keep track of the resulting string
- split the integer into digits
- iterate over the array of digits with index
  - determine the corresponding power of 10
  - find the range in the hash to which it applies and get the hash value
  - use an if-elsif conditional to determine how to use the hash value
    - if digit is 0 => go to the next digit in the array/iteration
    - digit is 1..3 => A[0] * digit
    - digit is 4 => A[0]A[1]
    - digit is 5 => A[1]
    - digit is 6..8 => A[1] + A[0] * (digit - 5)
    - digit is 9 => A[0]A[2]
  - append the results of the conditional to the result string
- output the concatenated result string
=end

# CODE

class RomanNumeral
NUMERALS = {
  1 => ['I', 'V', 'X'],
  10 => ['X', 'L', 'C'],
  100 => ['C', 'D', 'M'],
  1000 => ['M']
}
  def initialize(n)
    @num = n
  end

  def to_roman
    @num.digits.map.with_index do |digit, index|
      arr = NUMERALS[10**index]
      translate_digit(digit, arr)
    end.reverse.join('')
  end

  private

  def translate_digit(n, a)
    case n
    when 0 then ''
    when (1..3) then a[0] * n
    when 4 then a[0] + a[1]
    when 5 then a[1]
    when (6..8) then a[1] + a[0] * (n - 5)
    when 9 then a[0] + a[2]
    end
  end
end

num = RomanNumeral.new(1024)
p num.to_roman