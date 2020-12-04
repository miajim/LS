# RB120-RB129 OOP Small Problems
# Easy 2 - Problem 8 : Fix The Program - Expander
# Wed. 11/18/20

# PROBLEM STATEMENT
=begin
What is wrong with the following code? What fix(es) would you make?

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander

=end
# CODE

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3) # => call without self for this to work
    # may want to be able to choose how many times you want the string to repeat
  end

  private # or call with self and change the method to public

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander

# private methods can never be called with an explicit caller! (unless in Ruby
# 2.7 and above)