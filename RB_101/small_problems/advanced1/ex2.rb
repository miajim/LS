# RB101-RB109 Small Problems
# Advanced 1 - Problem 2: Seeing Stars
# Sat. 10/31/20

# PROBLEM STATEMENT
=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an
odd integer that is supplied as an argument to the method. The smallest such
star you need to handle is a 7x7 grid.

star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

Further Exploration
What other patterns can you come up with that can be produced in similar ways
to the patterns of this exercise? Can you draw a reasonable looking circle?
How about a sine wave?
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM/
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
  - create an nested array where the outer loop represents the row # and the
    inner loop represents the column #
  - # of stars for a given row = 3 unless it is the middle row (n / 2)
  - for each row (outer loop) calculate the indices of the stars
  - for each column (inner loop) place the * at the determined index,
    if the index is not a predetermined index, then place a space
  - if the outer loop index = n/2, then it is a row of *, no spaces
  - mirror the first (n/2 - 1) rows
  - join the subarrays
  - output each subarray (each one line)
=end
require 'pry'

def star(n)
  arr = []
  stars_at = [0, (n / 2), (n - 1)]
  (0..(n / 2)).each do |row|
    arr[row] = []
    (0...n).each do |col|
      if stars_at.include?(col) || row == n / 2
        arr[row][col] = "*"
      else
        arr[row][col] = " "
      end
    end
    stars_at[0] += 1
    stars_at[-1] -= 1
  end
  arr.map! { |subarr| subarr.join("") }
  puts (arr + arr[0...-1].reverse)
end

star(7)
star(9)

# LS Solution
def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

# print_row(7, 3)
# print_row(7, 2)
# print_row(7, 1)
# puts '*' * grid_size => middle row
# print_row(7, 1)
# print_row(7, 2)
# print_row(7, 3)