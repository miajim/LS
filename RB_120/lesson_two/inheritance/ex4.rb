# RB120-RB129 Object Oriented Programming
# Lesson 2 - Lecture Inheritance : Exercise 4
# Sun. 11/15/20
=begin
What is the method lookup path and how is it important?
=end


=begin
  Method lookup path is the order in which Ruby searches the class hierarchy
  when a method is invoked. It is important because it dictates the specific
  behavior of an object. The way a method is defined in one class may differ
  from how it's defined in another class or module (inherited or otherwise).

  LS Solution
  he method lookup path is the order in which Ruby will traverse the class
  hierarchy to look for methods to invoke. For example, say you have a Bulldog
  object called bud and you call: bud.swim. Ruby will first look for a method
  called swim in the Bulldog class, then traverse up the chain of super-classes;
  it will invoke the first method called swim and stop its traversal.

=end