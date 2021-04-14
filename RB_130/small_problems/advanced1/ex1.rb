# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Advanced 1 - Problem 1: Internal vs. External Iterators
# Mon. 01/11/2021


=begin

Thus far, we've used iterators often. You've seen the use of #each and #map used on various data structures,
such as Arrays and Hashes. These methods make writing certain code a bit easier, at least when compared to a
while or for loop. Yet, what we've seen thus far is only part of what is available.

Whenever we use map or each on something like an Array, we're using something called "Internal Iteration".
It's called that because the process and implementation of that iteration is hidden from us, and the process
that allows us to progress through a collection is part of that hidden implementation.

There's also "External Iteration". This is iteration that takes place at the behest of the user.
Ruby gives us the option to use this type of iteration with the Enumerator class. For this exercise,
lets take a bit of a tour of the capabilities of Enumerator. While we do that, let's make something interesting with it.

In this exercise, your task is to create a new Enumerator object. When creating a new Enumerator, you may define
what values are iterated upon. We'll want to create an Enumerator that can iterate over an infinite list of factorials.
Once you make this new Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.

More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, see what
happens if you print 3 more factorials (the results won't be correct). Now, reset your Enumerator (use the rewind method).
Finally, print 7 more factorials.

You can find almost everything you need for this exercise in the documentation for Enumerator. In particular,
check out the ::new method; it should prove a good starting point for this exercise. Some further details about
internal vs external iterators are mentioned at the start of that documentation, so make sure to read that section.
That section is a bit dense at places; if you don't understand everything about it, that's ok.

A factorial is a mathematical operation that involves multiplying a bunch of sequential positive numbers together.
They are usually written as a non-negative integer followed by an exclamation point, e.g., 4!.
=end

fact = Enumerator.new do |y|
  a = 1
  b = 1
  y << b

  loop do
    b = b * a
    y << b
    a += 1
  end
end

p fact.take(1) # -> [1]
p fact.take(2) # -> [1, 1]
p fact.take(3) # -> [1, 1, 2]
p fact.take(4) # -> [1, 1, 2, 6]
p fact.take(5) # -> [1, 1, 2, 6, 24]
p fact.take(6) # -> [1, 1, 2, 6, 24, 120]

# puts fact.next
# puts fact.next
# puts fact.next
# puts fact.next
# puts fact.next
# puts fact.next
# puts fact.next
# puts fact.next
# puts "--------"
# puts fact.next
# puts fact.next
# puts fact.next
# fact.rewind
# puts "---"
# puts fact.next
# puts fact.next
# puts fact.next