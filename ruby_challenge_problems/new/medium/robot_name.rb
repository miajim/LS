# LS Ruby Challenge Problems (New)
# Medium - Problem 2: Robot Name
# Mon. 01/25/2021

=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you
boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which
means that their name gets wiped. The next time you ask, it will respond with a
new random name.

The names must be random; they should not follow a predictable sequence. Random
names means there is a risk of collisions. Your solution should not allow the
use of the same name twice when avoidable.

=end

=begin
# Notes
Inputs
  -
Outputs
  -
Rules/Req's
  -
  -
  -
Questions
  -
  -
Algorithm
  - define a Robot class with #initialize, #reset, and attr_accessor :name
  - #initialize
    - set an instance variable @name to a random name (string)
      - first two characters are picked randomly A-Z
      - last three characters are a random 3 digit integer (100...999)
      - must check that the new name does not exist
        - keep track of this through the use of a class variable and array
          of names
  - #reset
    - pick a new random name that is not the same as the current random name or
      any other existing random name
  -
=end

# CODE

class Robot
  ALPHABET = ('A'..'Z').to_a
  attr_reader :name
  @@names = []

  def initialize
    reset
    @@names << @name
  end

  def reset
    previous_name = self.name
    loop do
      letter1 = ALPHABET[rand(0..25)]
      letter2 = ALPHABET[rand(0..25)]
      number = rand(100..999)
      self.name = "#{letter1}#{letter2}#{number}"
      break unless @@names.include?(name)
    end
    @@names.delete(previous_name) if previous_name
  end

  private

  attr_writer :name
end