# RB101-RB109 Lesson 4
# The PEDAC Problem Solving Process - Sum Even Number Rows Example: Implementing a Solution in Code
# Wed. 09/09/20

def sum_even_number_row(row_number)
  # 1) Create an empty rows array to contain all of the rows
  rows = []
  start_integer = 2
  # 2) Create a row array and add it to the overall rows array
    # 3) Repeat step 2 until all the necessary rows have been created
    # All the rows have been created when rows.length == row_number
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  # 4) Sum the final row
  # 5) Return the sum
  rows.last.sum # More than one way to implement this! (e.g., #each, #reduce)
end

def create_row(start_integer, row_length)
  # 1) Create an empty row array to contain the integers
  row = []
  current_integer = start_integer
  # 2) Add the starting integer
  # 3) Increment the starting integer by 2 to get the next integer in the seq.
  # 4) Repeat steps 2 & 3 until the array has reached the correct length
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  # 5) Return row array
  row
end
# Start the loop
#   - Add the start integer to the rwo
#   - Increment the starting integer by 2
#   - Break out of the loop if length of row equals row_length

# Calculating the start integer:
# Rule: First integer of row == last integer of preceding row + 2
# Algorithm for rule:
#  - Get the last row of the rows array
#  - Get the last integer of that row
#  - Add 2 to the integer

# The following 6 checks should output true:
p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]