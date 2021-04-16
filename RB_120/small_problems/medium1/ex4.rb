# RB120-RB129 OOP Small Problems
# Medium 1 - Problem 4: Circular Queue
# Tues. 12/8/20

# PROBLEM STATEMENT
=begin
A circular queue is a collection of objects stored in a buffer that is treated
as though it is connected end-to-end in a circle. When an object is added to
this circular queue, it is added to the position that immediately follows the
most recently added object, while removing an object always removes the object
that has been in the queue the longest.

This works as long as there are empty spots in the buffer. If the buffer becomes
full, adding a new object to the queue requires getting rid of an existing
object; with a circular queue, the object that has been in the queue the longest
is discarded and replaced by the new object.

Assuming we have a circular queue with room for 3 objects, the circular queue
looks and acts like this:

Your task is to write a CircularQueue class that implements a circular queue for
arbitrary objects. The class should obtain the buffer size with an argument
provided to CircularQueue::new, and should provide the following methods:

enqueue to add an object to the queue
dequeue to remove (and return) the oldest object in the queue. It should return
nil if the queue is empty.
You may assume that none of the values stored in the queue are nil (however, nil
may be used to designate empty spots in the buffer).


=end
# CODE
require 'pry'

class CircularQueue
  def initialize(buffer_size)
    @queue = Array.new(buffer_size)
    @indices = []
  end

  def correct(index)
    index > (@queue.size - 1) ? 0 : index
  end
  # find the empty position (nil). if there is no empty position, then replace the oldest element.
  def enqueue(obj) # added to the pos. that immediately follows the most recently added obj.
    # index = @queue.find_index(nil)
    # if queue_is_empty?
    #   index = 0
    # elsif queue_is_full?
    #   index = @indices.first
    #   @indices.shift
    # else
    #   index = correct(@indices.last + 1)
    # end

    unless queue_is_full?
      index = @indices.empty? ? 0 : correct(@indices.last + 1)
     # binding.pry
    else
      dequeue
      binding.pry
      enqueue(obj)
    end
    @queue[index] = obj
    @indices << index

    p @queue, @indices
  end

  def dequeue # removes the object that has been in the queue the longest
    return nil if queue_is_empty?
    removed_object = @queue[@indices.first]
    @queue[@indices.shift] = nil
    # p @queue
    removed_object
  end

  def queue_is_empty?
    @queue.all?(nil)
  end

  def queue_is_full?
    @queue.none?(nil)
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil