# RB120-RB129 OOP
# OO Basics Inheritance - Problem 5 : Towable (Part 1)
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the following code, create a Towable module that contains a method named
tow that prints I can tow a trailer! when invoked. Include the module in the
Truck class.

class Truck
end

class Car
end

truck1 = Truck.new
truck1.tow

Expected output:
I can tow a trailer!

=end
# CODE

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow