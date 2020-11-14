# RB101-RB109 Small Problems
# Advanced 1 - Problem 3: Transpose 3x3
# Sun. 11/01/20

# PROBLEM STATEMENT
=begin
A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array
and all of the sub-Arrays has 3 elements. For example:
1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

The transpose of a 3 x 3 matrix is the matrix that results from exchanging
the columns and rows of the original matrix. For example, the transposition
of the array shown above is:

1  4  3
5  7  9
8  2  6

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns
the transpose of the original matrix. Note that there is a Array#transpose
method that does this -- you may not use it for this exercise. You also are
not allowed to use the Matrix class from the standard library. Your task is
to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix
and leave the original matrix unchanged.

Examples

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

This program should print "true" twice.

Further Exploration
Write a transpose! method that transposes a matrix in place. The obvious
solution is to reuse transpose from above, then copy the results
back into the array specified by the argument. For this method, don't use
this approach; write a method from scratch that does the in-place transpose.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - a nested 3x3 array
  Outputs
    - a nested 3x3 array (transpose of input array)
Rules/Implicit Requirements
  - return a new array (i.e., do not mutate the input array)
  - swap rows & columns
  - if the row # == column #, no need to swap
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
  - iterate through the nested array
  - in the inner most loop
    - if the column # == row #, then return the element
    - otherwise
      - do a parallel assignment of the elements at [r][c] and [c][r]
=end

# Initial Solution
# def transpose(matrix)
#   matrix.map.with_index do |row, r|
#     row.map.with_index do |col, c|
#       if r == c
#         matrix[r][c]
#       else
#         matrix[c][r]
#       end
#     end
#   end
# end

# Refactored Solution
def transpose(matrix)
  matrix.map.with_index { |row, r| row.map.with_index { |col, c| matrix[c][r] } }
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

matrix = [
  [1, 5, 8, 3],
  [4, 7, 2, 0],
  [3, 9, 6, 9],
  [2, 3, 0, 1]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3, 2], [5, 7, 9, 3], [8, 2, 6, 0], [3, 0, 9, 1]]
p matrix == [[1, 5, 8, 3], [4, 7, 2, 0], [3, 9, 6, 9], [2, 3, 0, 1]]

# Further Exploration

def transpose!(matrix)
  matrix.each_with_index do |row, r|
    row.each_with_index { |col, c| matrix[r][c], matrix[c][r] = matrix[c][r], matrix[r][c] }
  end
end

p matrix == transpose!(matrix)
p matrix.object_id
p transpose!(matrix).object_id