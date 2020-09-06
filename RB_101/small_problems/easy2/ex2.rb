# RB101-RB109 Small Problems
# Easy 2 - Problem 2: How big is the room?
# Fri. 09/04/20

# PROBLEM STATEMENT
=begin
Build a program that asks a user for the length and width of a room in meters
and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

Further Exploration
Modify this program to ask for the input measurements in feet,
and display the results in square feet, square inches, and square centimeters.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
Outputs
Rules/Implicit Requirements
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
Inputs
Rules

ALGORITHM
=end

# CODE
# puts "Enter the length of the room in meters: "
# length = gets.chomp.to_f
# puts "Enter the width of the room in meters: "
# width = gets.chomp.to_f

# area_m = length * width
# area_ft = area_m*10.7639

# puts "The area of the room is #{area_m} square meters (#{area_ft.truncate(2)} square feet). "

# LS Solution Notes
# Use a constant to store the conversion factor.
# Use Float#round to round both areas to the nearest 2 decimal places.


# Further Exploration
SQFT_TO_SQIN = 144
SQIN_TO_SQCM = 2.54 ** 2
puts "Enter the length of the room in feet: "
length = gets.chomp.to_f
puts "Enter the width of the room in feet: "
width = gets.chomp.to_f

area_sqft = (length * width).round(2)
area_sqin = (area_sqft * SQFT_TO_SQIN).round(2)
area_sqcm = (area_sqin * SQIN_TO_SQCM).round(2)

puts "The area of the room is:
#{area_sqft} square feet
#{area_sqin} square in
#{area_sqcm} square cm."