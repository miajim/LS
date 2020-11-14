# RB101-RB109 Small Problems
# Advanced 1 - Problem 4: Transpose M x N
# Sun. 11/01/20

# PROBLEM STATEMENT
=begin
In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as
represented by a ruby Array of Arrays.

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices.
Any matrix can be transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with
any matrix with at least 1 row and 1 column.

Examples:

transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]
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

def transpose(matrix)
  matrix.map.with_index do |row, r|
    row.map.with_index do |col, c|
      if r == c
        matrix[r][c]
      else
        matrix[c][r]
      end
    end
  end
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]