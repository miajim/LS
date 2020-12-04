# RB120-RB129 OOP Small Problems
# Easy 2 - Problem 4 : Reverse Engineering
# Wed. 11/18/20

# PROBLEM STATEMENT
=begin
Write a class that will display:

ABC
xyz

when the following code is run:

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

=end
# CODE

class Transform
  attr_reader :data

  def initialize(str)
    @data = str
  end

  def uppercase
    data.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')