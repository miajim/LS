# RB120-RB129 OOP Small Problems
# Easy 1 - Problem 4 : Fix the Program - Books (Part 2)
# Tues. 11/17/20

# PROBLEM STATEMENT
=begin
Complete this program so that it produces the expected output:

class Book
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

Expected output:
The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.


Further Exploration
What do you think of this way of creating and initializing Book objects?
(The two steps are separate.) Would it be better to create and initialize at the
same time like in the previous exercise? What potential problems, if any, are
introduced by separating the steps?
=end
# CODE

class Book
  attr_accessor :title, :author
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further Exploration
=begin
While this isn't as clear by just looking at the class what is being initialized
(since there is no initialize method), I do like this method better because
it removes the extra step of initializing the instance variables both in their
respective getter method and in the initialize instance method. If we didn't
want the instance variables to be accessible outside of the class, particularly
the ability to overwrite either variable, then this two-step process would not
be feasible since the setter (and potentially getter) methods would be private.
A separate public instance method would have to act as an intermediary step
between the object and the getter/setter method.
=end