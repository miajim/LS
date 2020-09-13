# RB101-RB109 Small Problems
# Easy 3 - Problem 4: Multiplying Two Numbers
# Sun. 09/06/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Create a method that takes two arguments, multiplies them together, and returns the result.

Example:

multiply(5, 3) == 15

Further Exploration
For fun: what happens if the first argument is an Array? What do you think is happening here?

=end


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) == 15 # => true

# Further exploration
# [1, 2] * 2
# => [1, 2, 1, 2]

# Per Ruby docs, Array#* : Repetition - w/ a string arg, * is equivalent to ary.join(str)
# Otherwise, it returns a new array built by concatenating int # of copies of self.

# Signatures
# ary * int --> new_ary
# ary * str --> new_str

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Achtung: The * operator behaves differently depending on the operand on the
# LEFT side!

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes