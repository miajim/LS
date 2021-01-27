# LS Ruby Challenge Problems (New)
# Easy - Problem 7: Octal
# Sun. 01/24/2021

=begin
Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output. Treat invalid input as octal 0.

Note: Implement the conversion yourself. Don't use any built-in or library methods that perform the necessary conversions for you. In this exercise, the code necessary to perform the conversion is what we're looking for,

About Octal (Base-8)

Decimal is a base-10 system. A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

The rightmost digit gets multiplied by 100 = 1
The next digit gets multiplied by 101 = 10
The digit after that gets multiplied by 102 = 100
The digit after that gets multiplied by 103 = 1000
...
The n*th* digit gets multiplied by 10n-1.
All of these values are then summed.
Thus:
Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output. Treat invalid input as octal 0.

Note: Implement the conversion yourself. Don't use any built-in or library methods that perform the necessary conversions for you. In this exercise, the code necessary to perform the conversion is what we're looking for,

About Octal (Base-8)

Decimal is a base-10 system. A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

The rightmost digit gets multiplied by 100 = 1
The next digit gets multiplied by 101 = 10
The digit after that gets multiplied by 102 = 100
The digit after that gets multiplied by 103 = 1000
...
The n*th* digit gets multiplied by 10n-1.
All of these values are then summed.
Thus:
  233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1

Octal numbers are similar, but the use powers of 8 instead
of powers of 10. Thus:
  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

=end

=begin
# Notes
Inputs
  - string representing an octal number
Outputs
  - integer represeting the octal number converted to decimal
Rules/Req's
  - octal numbers must only contain the digits 0-7
  -
  -
Questions
  -
  -
Algorithm
  - define an Octal class with #initialize and #to_decimal
  - #initialize => store the string in an instance var.
  - # to_decimal
    - guard clause: return 0 unless the number in the string is a valid octal
    - convert the string into an integer, split into an array of digits
    - iterate over the array with index
    - calculate the equivalent decimal number digit by digit
      - digit * 8^index
    - sum the values in the array & return the sum
=end

# CODE

class Octal
  def initialize(str)
    @octal = str
  end

  def to_decimal
    return 0 unless @octal.match(/^[0-7]+$/)
    @octal.to_i.digits.map.with_index do |char, i|
      char.to_i * 8 ** i
    end.sum
  end
end