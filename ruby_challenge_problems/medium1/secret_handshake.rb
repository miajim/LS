# LS Ruby Challenge Problems
# Medium 1 - Problem 1: Secret Handshake
# Tues. 01/26/2021

=begin
Write a program that will take a decimal number, and convert it to the
appropriate sequence of events for a secret handshake.

There are 10 types of people in the world: Those who understand binary, and
those who don't. You and your fellow cohort of those in the "know" when it
comes to binary decide to come up with a secret "handshake".

1 = wink
10 = double blink
100 = close your eyes
1000 = jump


10000 = Reverse the order of the operations in the secret handshake.

handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]
=end

=begin
# Notes
Inputs
  - one value: integer or string
Outputs
  - an array of 0 or more strings
Rules/Req's
  - if the input is an integer -> decimal number, needs to be converted
    to binary before looking up the word value
  - if the input is a string -> binary number, lookup word value
  -
Questions
  -
  -
Algorithm
  - define a class named SecretHandshake with #initialize and #commands
  - define an array constant with words as strings
  - #initialize
    - set an instance variable to the argument
      - if the argument is a string, convert it to an integer
      - if the argument is an integer, convert it to a binary string, then to an
        integer
  - #commands
    - split the binary number into an array of digits and iterate over the array
      with an index
    - if current digit is 1, then find the value in the array constant at the
      current index
    - if the array is 5 digits long and the 5th digit is 1, then reverse the
      array of words
=end

# CODE
class SecretHandshake
  ACTIONS = ['wink', 'double blink', 'close your eyes', 'jump']
  def initialize(arg)
    @binary = (arg.is_a?(String) ? arg : arg.to_s(2)).to_i
  end

  def commands
    digits = @binary.digits
    handshake = ACTIONS.select.with_index { |_, i| digits[i] == 1 }
    digits.size == 5 && digits.last == 1 ? handshake.reverse! : handshake
  end
end

# handshake = SecretHandshake.new 9
# p handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# p handshake.commands # => ["jump","wink"]