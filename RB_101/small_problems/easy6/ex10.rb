# RB101-RB109 Small Problems
# Easy 6 - Problem 10: Right Triangles
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that takes a positive integer, n, as an argument, and displays a
right triangle whose sides each have n stars. The hypotenuse of the triangle
(the diagonal side in the images below) should have one end at the lower-left
of the triangle, and the other end at the upper-right.

triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

Further Exploration
Try modifying your solution so it prints the triangle upside down from its current orientation.
Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.
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


# CODE
def triangle(n)
  count = n
  n.times do |n|
    puts " " * (count-(n + 1)) + "*" * (n + 1)
  end
end

# triangle(5)
# triangle(9)

# Further Exploration
def quad_iv(n)
  count = n
  n.times do |n|
    puts " " * (n) + "*" * (count - n)
  end
end

def quad_ii(n)
  count = n
  n.times do |n|
    puts "*" * (n + 1) + " " * (count-(n + 1))
  end
end

def quad_iii(n)
  count = n
  n.times do |n|
    puts "*" * (count - n) + " " * (n)
  end
end

# uses the cartesian grid quadrant labeling (i-iv)
def flexible_triangle(n, quadrant)
  case quadrant
  when 1 then triangle(n)
  when 2 then quad_ii(n)
  when 3 then quad_iii(n)
  when 4 then quad_iv(n)
  end
end

# alternative solution w/ 3 supporting methods, 1 main method (flexible_triangle)
# I really liked James Lafferty's solution; much cleaner & makes use of triangle
# and upside_down_triangle methods
def plus_minus(num_stars, num_spaces, quadrant)
  if quadrant == 1 || quadrant == 2
    num_stars += 1
    num_spaces -= 1
  else
    num_stars -= 1
    num_spaces += 1
  end
  return num_stars, num_spaces
end

def starting_stars_spaces(n, quadrant)
  if quadrant == 1 || quadrant == 2
    num_stars = 1
    num_spaces = n - 1
  else
    num_stars = n
    num_spaces = 0
  end
  return num_stars, num_spaces
end

def order(num_stars, num_spaces, quadrant)
  space = " "
  star = "*"
  if quadrant == 1 || quadrant == 4
    first = space * num_spaces
    second = star * num_stars
  else
    first = star * num_stars
    second = space * num_spaces
  end
  return first, second
end

def flexible_triangle(n, quadrant)
  num_stars, num_spaces = starting_stars_spaces(n, quadrant)
    n.times do |n|
      first, second = order(num_stars, num_spaces, quadrant)
      puts first + second
      num_stars, num_spaces = plus_minus(num_stars, num_spaces, quadrant)
    end
end

flexible_triangle(5, 1)
flexible_triangle(5, 2)
flexible_triangle(5, 3)
flexible_triangle(5, 4)