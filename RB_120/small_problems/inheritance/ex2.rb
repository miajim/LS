# RB120-RB129 OOP
# OO Basics Inheritance - Problem 2 : Start the Engine (Part 1)
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Change the following code so that creating a new Truck automatically invokes
#start_engine.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year

Expected output:
Ready to go!
1994

=end
# CODE

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle

  def initialize(year)
    super
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year