# RB120-RB129 OOP Small Problems
# Debugging - Problem 5 : Files
# Mon. 12/7/20

# PROBLEM STATEMENT
=begin
You started writing a very basic class for handling files. However, when you
begin to write some simple test code, you get a NameError. The error message
complains of an uninitialized constant File::FORMAT.

What is the problem and what are possible ways to fix it?

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

Further Exploration
If you aren't familiar with Module#alias_method, take a moment to view Ruby's
documentation. You don't need to memorize this method, but get in the habit of
referring to documentation when you see code you aren't familiar with.
=end
# CODE
class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

# Further Exploration
=begin
Module#alias_method
  - signature: alias_method(new_name, old_name) --> self
  - definition: makes new_name a new copy of the method old_name. This can be
    used to retain access to methods that are overridden

=end