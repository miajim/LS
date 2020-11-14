=begin
Mon. 11/2/20
Find the Mine (6 kyu)

You've just discovered a square (NxN) field and you notice a warning sign.
The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns
the location of the mine. The mine is represented as the integer 1 in the 2D array.
Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array (Tuple<int, int> in C#) where the first
element is the row index, and the second element is the column index of the bomb
location (both should be 0 based). All 2D arrays passed into your function will
be square (NxN), and there will only be one mine in the array.

# Notes
Inputs
  - nested array with integer elements (either zero or 1)
Outputs
  - a two element array with the row and column location of the mine (1)
Rules/Req's
  - a position with a mine has a value of 1; all other positions have a value of 0
  - there is only one mine & there will always be 1 mine
  -
  -
Questions
  -
  -
Algorithm
  - iterate through the input array (nested loop)
    - outer loop (0...length of input array) <-- row
    - inner loop (0...length of subarray) <-- column
    - if the current element is 1, return the array with the current indices
      i.e., [row, column]
=end

# Initial Solution
# def mineLocation(arr)
#   arr.each_with_index do |row, i|
#     (0...row.size).each do |col_i|
#       return [i, col_i] if arr[i][col_i] == 1
#     end
#   end
# end

# Alternative Solution (only 1 iteration)
def mineLocation(arr)
  arr.each_with_index { |row, i| return [i, row.index(1)] if row.include?(1) }
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
