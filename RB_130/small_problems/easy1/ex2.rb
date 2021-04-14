# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy 1 - Problem 2 : Optional Blocks
# Tues. 01/05/2021

=begin
  Write a method that takes an optional block. If the block is specified, the
  method should execute it, and return the value returned by the block. If no
  block is specified, the method should simply return the String 'Does not compute.'.
=end

# def compute
#   block_given? ? yield : 'Does not compute.'
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# Further Exploration
=begin
Modify the compute method so it takes a single argument and yields that argument
to the block. Provide at least 3 examples of calling this new version of compute,
including a no-block call.
=end

def compute(arg = nil)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute(5) == 'Does not compute.'
p compute(5) { |n| n + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'
# p compute { |n| n + 3 } <-- current definition does not account for a case like this
# could use an if-elseif-else to account for this case.