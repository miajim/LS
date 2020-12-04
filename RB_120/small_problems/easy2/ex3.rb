# RB120-RB129 OOP Small Problems
# Easy 2 - Problem 3 : Complete the Program - Houses
# Tues. 11/17/20

# PROBLEM STATEMENT
=begin
Assume you have the following code:

class House
  attr_reader :price

  def initialize(price)
    @price = price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

and this output:
Home 1 is cheaper
Home 2 is more expensive

Modify the House class so that the above program will work. You are permitted
to define only one new method in House.

Further Exploration
Is the technique we employ here to make House objects comparable a good one?
(Hint: is there a natural way to compare Houses? Is price the only criteria you
might use?) What problems might you run into, if any? Can you think of any sort
of classes where including Comparable is a good idea?

=end
# CODE

class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(comparison)
    price <=> comparison.price
  end
end

=begin
First thought: override the < and > methods, but I am only allowed to define one
new method.

Second thought: I need to return the value referenced by @price when the object
is called. Seems like this would be complicated.

Third thought: Move on and circle back.

=end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

=begin
Further Exploration

Right now we're only allowed to compare House objects by comparing their price
(integers). Houses could also be compared by square footage, number of bedrooms,
number of bathrooms, acreage, etc. They could also be compared by qualitative
factors such as location, community, quality of schools, etc.

I think the <=> as currently defined within House is not flexible enough. It
should be able to compare any numeric object. This could probably be achieved
by adding in a second argument that takes a string (the criteria that you want
to use for the comparison) and writing in a case statement. Instance variables
and associated getter methods would need to be added for quantifiable criteria.

Any classes that would benefit from a quantitative comparison should include
the Comparable module.
=end