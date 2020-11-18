# RB120-RB129 OOP Small Problems
# Easy 1 - Problem 10 :
# Tues. 11/17/20

# PROBLEM STATEMENT
=begin
Consider the following classes:

class Car
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    4
  end

  def to_s
    "#{make} #{model}"
  end
end

class Motorcycle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    2
  end

  def to_s
    "#{make} #{model}"
  end
end

class Truck
  attr_reader :make, :model, :payload

  def initialize(make, model, payload)
    @make = make
    @model = model
    @payload = payload
  end

  def wheels
    6
  end

  def to_s
    "#{make} #{model}"
  end
end

Refactor these classes so they all use a common superclass, and inherit behavior as needed.


Further Exploration
Would it make sense to define a wheels method in Vehicle even though all of the
remaining classes would be overriding it? Why or why not? If you think it does
make sense, what method body would you write?


I think it would make sense to include a wheels method in Vehicle as well,
because a vehicle inherently has wheels. Since the number of wheels is
a characteristic of the class and not a specific instance of a class, then it
would make sense to implement it as class constant.

=end
# CODE

class Vehicle
  attr_reader :make, :model
  NUM_WHEELS = 4

  def initialize(make, model)
    @make = make
    @model = model
  end

  def self.wheels
    self::NUM_WHEELS
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  NUM_WHEELS = 4
end

class Motorcycle < Vehicle
  NUM_WHEELS = 2
end

class Truck < Vehicle
  NUM_WHEELS = 6
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

p Car.wheels
p Motorcycle.wheels
p Truck.wheels