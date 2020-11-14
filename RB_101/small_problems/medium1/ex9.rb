# RB101-RB109 Small Problems
# Medium 1 - Problem 9: Fibonacci Numbers (Procedural)
# Wed. 10/28/20

# PROBLEM STATEMENT

=begin
In the previous exercise, we developed a recursive solution to calculating
the nth Fibonacci number. In a language that is not optimized for recursion,
some (not all) recursive methods can be extremely slow and require massive
quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for
heavy recursion; as a result, the Fibonacci solution is only useful up to about
fibonacci(40). With higher values of nth, the recursive solution is impractical.
(Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    -
  Outputs
    -
Rules/Implicit Requirements
  -
  -
  -
Clarifying Questions
  -
Mental Model (optional)
  -

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    -
  Rules
    -

ALGORITHM
  -
=end


# Procedural
# def fibonacci(pos)
#   arr = []
#   (1..pos).each do |nth|
#     if nth == 1 || nth == 2
#       arr << 1
#     else
#       arr << (arr[nth - 2] + arr[nth - 3])
#     end
#   end
#   arr.last
# end

# Refactored Procedural
def fibonacci(pos)
  (1..pos).each_with_object([]) { |nth, arr| arr << (nth < 3 ? 1 : (arr[nth - 2] + arr[nth - 3])) }.last
end

p fibonacci(17)
p fibonacci(18)
p fibonacci(19)
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501


# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765