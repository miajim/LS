# RB120-RB129 OOP
# OO Basics Inheritance - Problem 1 : Inherited Year
# Fri. 11/13/20

# PROBLEM STATEMENT
=begin
Create a module named Transportation that contains three classes: Vehicle,
Truck, and Car. Truck and Car should both inherit from Vehicle.

=end
# CODE
module Transportation
  class Vehicle ; end
  class Truck < Vehicle ; end
  class Car < Vehicle ; end
end