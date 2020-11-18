# RB120-RB129 OOP Small Problems
# Easy 1 - Problem 3 : Fix the Problem - Books (Part 1)
# Mon. 11/16/20

# PROBLEM STATEMENT
=begin
Complete this program so that it produces the expected output:

class Book
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

Expected output:
The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.

Further Exploration
What are the differences between attr_reader, attr_writer, and attr_accessor?
Why did we use attr_reader instead of one of the other two? Would it be okay to
use one of the others? Why or why not?

Instead of attr_reader, suppose you had added the following methods to this class:

def title
  @title
end

def author
  @author
end

Would this change the behavior of the class in any way? If so, how? If not,
why not? Can you think of any advantages of this code?

=end
# CODE

class Book
  attr_reader :title, :author

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further Exploration
=begin
attr_reader creates a getter method (returns the object referenced by the
instance variable)

attr_writter creates a setter method (allows for the instance variable to be
reassigned)

attr_accessor creates both getter and setter methods.

In this case, we are not reassigning the book title or the book author, so it
isn't necessary to create a setter method. We also probably wouldn't want this
information to be changed outside of the class, so if we did include setter
methods, then they would likely be private or protected, depending on how we
wanted to implement them.

Using the "expanded" versions of the getter methods wouldn't make a differene.
It would just give us more flexibility to add other behaviors within the instance
method, if desired. If we wanted to format the title and/or author in a certain
way each time we called the getter method, then using the "expanded form" could
be beneficial.

=end