# RB120-RB129 OOP Small Problems
# Easy 1 - Problem 6 : Fix the Program - Flight Data
# Tues. 11/17/20

# PROBLEM STATEMENT
=begin
Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

There is nothing technically incorrect about this class, but the definition may
lead to problems in the future. How can this class be fixed to be resistant to
future problems?

Hint: Consider what might happen if you leave this class defined as it is,
and later decide to alter the implementation so that a database is not used.
=end
# CODE

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

=begin
Before looking at the hint:
You may not want the database to be available for modification by others, so
it may make the most sense to use attr_reader to keep the getter method public
and create a private setter method that can only be used within the context of
the class.

After looking at the hint:
You could make the database an optional parameter by creating a database
parameter and assigning it to Database.init or nil, which could be overridden
if needed. Alternatively, you could just leave out the assignment of
@database_handle from the initialize method, and keep the corresponding setter
method to allow the instance variable to be initialized when needed.

Summary of LS Solution:
Because @database_handle is publicly accessible, there may be other code that
is now dependent on this database. This dependency might prevent you from
being able to alter the current class definition.
=end