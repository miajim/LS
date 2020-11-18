# RB120-RB129 OOP Small Problems
# Easy 1 - Problem 9 : Complete the Program - Cats!
# Tues. 11/17/20

# PROBLEM STATEMENT
=begin
Consider the following program.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

Update this code so that when you run it, you see the following output:

My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.

Further Exploration
An alternative approach to this problem would be to modify the Pet class to
accept a colors parameter. If we did this, we wouldn't need to supply an
initialize method for Cat.

Why would we be able to omit the initialize method? Would it be a good idea to
modify Pet in this way? Why or why not? How might you deal with some of the problems,
if any, that might arise from modifying Pet?

=end
# CODE

# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   attr_reader :name, :age, :color

#   def initialize(name, age, color)
#     super(name, age)
#     @color = color
#   end

#   def to_s
#     "My cat #{name} is #{age} and has #{color} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

# Further Exploration

class Pet
  attr_reader :name, :age, :colors
  def initialize(name, age, colors)
    @name = name
    @age = age
    @colors = colors
  end
end

class Cat < Pet
  def to_s
    "My cat #{name} is #{age} and has #{colors} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

=begin
  We're able to omit the initialize method in cat when we add the colors
  parameter to initialize in Pet because of the method lookup path. The class
  method new will look for an initialize instance method to implement. It won't
  find it in the Cat class, so it'll look in the Pet class.

  Because it adds another "layer" of specificity, maybe it is best to keep
  the colors parameter within Cat#initialize.
=end