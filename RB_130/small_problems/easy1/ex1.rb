# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy 1 - Problem 1: Enumerable Class Creation
# Tues. 01/05/2021
=begin
Assume we have a Tree class that implements a binary tree.

class Tree
  ...
end

A binary tree is just one of many forms of collections, such as Arrays, Hashes,
Stacks, Sets, and more. All of these collection classes include the Enumerable
module, which means they have access to an each method, as well as many other
iterative methods such as map, reduce, select, and more.

For this exercise, modify the Tree class to support the methods of Enumerable.
You do not have to actually implement any methods -- just show the methods that
you must provide.
=end

class Tree
  include Enumerable

  def each
    # implementation here
  end

  def <=> # for the Comparable module, although Enumerable also has #min, #max, and #sort
    # implementation here
  end
end