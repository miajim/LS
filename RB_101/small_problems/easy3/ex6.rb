# RB101-RB109 Small Problems
# Easy 3 - Problem 6: Exclusive Or
# Tues. 09/08/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
The || operator returns a truthy value if either or both of its operands are truthy,
a falsey value if both operands are falsey. The && operator returns a truthy value
if both of its operands are truthy, and a falsey value if either operand is falsey.
This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

In this exercise, you will write a function named xor that takes two arguments,
and returns true if exactly one of its arguments is truthy, false otherwise.
Note that we are looking for a boolean result instead of a truthy/falsy value
as returned by || and &&.

Examples:

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

# Further Exploration
Can you think of a situation in which a boolean xor method would be useful?
Suppose you were modeling a light at the top of a flight of stairs wired in
such a way that the light can be turned on or off using either the switch at
the bottom of the stairs or the switch at the top of the stairs. This is an xor
configuration, and it can be modeled in ruby using the xor method.
Think of some additional examples.

|| and && are so-called short circuit operators in that the second operand is
not evaluated if its value is not needed. Does the xor method perform short-circuit
evaluation of its operands? Why or why not?
Does short-circuit evaluation in xor operations even make sense?

=end


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# initial "hack and slash" solution
def xor?(arg1, arg2)
  return false if arg1 && arg2
  return false unless arg1 || arg2
  return true
end


# refactored solution
def xor?(arg1, arg2)
  return false if ((arg1 && arg2) || !(arg1 || arg2))
  return true
end

# super refactored
def xor?(arg1, arg2)
  ((arg1 && arg2) || !(arg1 || arg2)) ? false : true
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# Further Exploration

# I think xor is commonly used in circuits, probably present in motherboards as
# well. It could also be applicable to locks / security passwords, in the sense that
# it could serve as a one-way validation.
# The short-circuit is applicable to the && expressions, but not to the overall
# || expression, therefore xor is not possible to short-circuit.


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Longer Solution
def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

# Refactored solution
def xor?(value1, value2)
  !!((value1 && !value2) || (value2 && !value1)) # !! forces a boolean return value
end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
