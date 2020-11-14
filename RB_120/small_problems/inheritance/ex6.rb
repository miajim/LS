# RB120-RB129 OOP
# OO Basics Inheritance - Problem 6 : Towable (Part 2)
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the following code, create a class named Vehicle that, upon instantiation,
assigns the passed in argument to @year. Both Truck and Car should inherit
from Vehicle.

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year

Expected output:
1994
I can tow a trailer!
2006

=end
# CODE

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehicle
  attr_reader :year
  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year