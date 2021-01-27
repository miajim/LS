# LS Ruby Challenge Problems (New)
# Medium - Problem 5: Simple Linked List
# Tues. 01/26/2021

=begin
Write a simple linked list implementation. The linked list is a fundamental data
structure in computer science, often used in the implementation of other data
structures.

The simplest kind of linked list is a singly linked list. Each element in the
list contains data and a "next" field pointing to the next element in the list
of elements. This variant of linked lists is often used to represent sequences
or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data
such as the numbers 1-10. Provide functions to reverse the linked list and
convert a linked list to and from an array.


=end

=begin
# Notes
Inputs
  -
Outputs
  -
Rules/Req's
  -
  -
  -
Questions
  -
  -
Algorithm
  - define an Element class and SimpleLinkedList class
  - Element instance methods: initialize, datum, tail? next
  - SimpleLinkedList instance methods: initialize, size, empty?, push, peek,
    head, pop, to_a, reverse
    - #push should create a new instance of the Element class passing the argument
      to an instance variable, datum
    - #head should return the first Element object in the list
      - head becomes the last item added ot the list
    - #peek returns the datum of the last element added to the list
    - #pop should remove the last item added to the list and return the datum
    - #to_a should return the datums of the elements in the linked list in
      reverse in an array
    - #reverse
  - SimpleLinkedList class methods: from_a
    - ::from_a()
    - if passed an empty array or nil, then create a linked list of size 0
    - if passed an array with elements, iterate through the reverse of the
      array and create Element objects using the array elements as the datum
=end

# CODE