# RB120-RB129 OOP Small Problems
# Easy 2 - Problem 5 : What Will This Do?
# Wed. 11/18/20

# PROBLEM STATEMENT
=begin
What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata  # => 'ByeBye'
puts thing.dupdata # => 'HelloHello'


=end
# CODE