# RB101-RB109 Small Problems
# Easy 5 - Problem 10: Bennerizer
# Thurs. 09/17/20

# PROBLEM STATEMENT
=begin
Write a method that will take a short line of text, and print it within a box.

Example:

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
print_in_box('')
+--+
|  |
|  |
|  |
+--+
You may assume that the input will always fit in your terminal window.

Further Exploration
Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box).
For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.

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
  # find the length of the input string
  top and bottom border
  # multiply this value by the dash character and print between +- and -+ to the screen

  middle
  # print a line of "| " and " |" with string.length * " " (spaces for padding)
  # print the input string with "| " and " |"
  # print another line of "| " and " |" with string.length * " " (spaces for padding)

=end

# CODE
def print_in_box(str)
  # guard clause for strings larger than the standard terminal window
  str = str[0..79] if str.length > 80
  padding = str.length + 2

  top_n_bot = "+" + "-"*padding + "+"
  middle = "|" + " "*padding + "|"
  string = "| " + str + " |"
  box = [top_n_bot, middle, string, middle, top_n_bot]

  puts box
end

print_in_box('To boldly go where no one has gone before.')
print_in_box("")
print_in_box("multiply this value by the dash character and print between +- and -+ to the screen")

# Further exploration
# write a method that wraps a string (split a string every 80 characters, add a newline after each split)
  # store each line in an array?
# print each line of the string prepended by "| " and " |"
# maintain top & bottom and middle formatting as per usual
MAX_CHAR = 80 - 4

# def wrap(str)
#   num_lines, _ = str.length.divmod(MAX_CHAR)
#   # add a newline (\n) after every 80th character
#   # find the multiples of every 80th character
#   num_lines.times do |line_num|
#     str.insert(MAX_CHAR*(line_num + 1) + line_num, "\n")
#   end
#   str
# end

# def wrap(str)
#   ary = []
#   indices = []
#   count = 0

#   num_lines, remainder = str.length.divmod(MAX_CHAR)

#   (0..str.length).step(MAX_CHAR) { |x| indices << x }
#   indices << str.length unless remainder == 0

#   while count < indices.length - 1
#     ary << str[indices[count]...indices[count + 1]]
#     count += 1
#   end
#   return ary, num_lines
# end

# refactored wrap
def wrap(str)
  ary = []
  start = 0

  while start <= str.length
    ary << str[start...(start + MAX_CHAR)]
    start += MAX_CHAR
  end
  ary
end

# Range example
# 0...80
# 80...160
# 160...240, etc.

# store groups of 80 or less characters of a string as elements in an array
# loop through "| " + str_ary[i] " |" i times based on the number of elements in the array

def print_in_box(str)
  padding = str.length < MAX_CHAR ? str.length : MAX_CHAR
  wrapped_string = wrap(str)
  top_n_bot = "+-" + "-"*padding + "-+"
  middle = "| " + " "*padding + " |"

  puts top_n_bot
  puts middle
  wrapped_string.each { |str_line| puts ("| " + str_line.center(padding) + " |") }
  puts middle
  puts top_n_bot
end

print_in_box("Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). This is my test.")
print_in_box('To boldly go where no one has gone before.')
print_in_box("")
print_in_box("multiply this value by the dash character and print between +- and -+ to the screen")

# Extra extra challenge would be to wrap text such that words do not get split when truncated!