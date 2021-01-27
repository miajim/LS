# LS Ruby Challenge Problems
# Medium 1 - Problem 2: Luhn
# Tues. 01/26/2021

=begin

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
  -
  -
  -
=end

# CODE

class Luhn
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def addends
    @num.digits.map.with_index do |digit, i|
      if i.odd?
        double = digit * 2
        double > 9 ? (double - 9) : (double)
      else
        digit
      end
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    temp_luhn = Luhn.new(number * 10)

    if temp_luhn.valid?
      temp_luhn.num
    else
      temp_luhn.num + (10 - temp_luhn.checksum % 10)
    end
  end
end

# Original Luhn::create method
# def self.create(number)
  # remainder = Luhn.new(number * 10).checksum % 10
  # last_digit = remainder == 0 ? remainder : (10 - remainder)
  # valid_luhn = num.digits.reverse.append(last_digit)
  # valid_luhn.join.to_i
# end
