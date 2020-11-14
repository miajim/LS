# RB120-RB129 OOP
# OO Basics Inheritance - Problem 1 : Inherited Year
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the following code, create two classes - Truck and Car - that both
inherit from Vehicle.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year

Expected output:


=end
# CODE

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle ; end
class Car < Vehicle ; end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year