# RB101-RB109 Lesson 3
# Practice Problems - Medium 1: Question 4
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

=end

# CODE
# << mutates the original buffer object
# using the + in combination with the reassignment (=) means that the buffer
# object points to a new object each time the method is run
# Either solution appears to work as-intended, though they are different in how
# they produce the same result.

# LS Solution
# rolling_buffer1 modifies the input argument buffer
# rolling_buffer2 will not modify the input argument buffer