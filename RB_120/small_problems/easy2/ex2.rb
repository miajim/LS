# RB120-RB129 OOP Small Problems
# Easy 2 - Problem 2 : Driveable
# Tues. 11/17/20

# PROBLEM STATEMENT
=begin

Correct the following program so it will work properly. Assume that the Car
class has a complete implementation; just make the smallest possible change to
ensure that cars have access to the drive method.

module Drivable
  def self.drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

Expected output:


=end
# CODE

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive