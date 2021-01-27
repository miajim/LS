# LS Ruby Challenge Problems (New)
# Medium - Problem 1: Diamond
# Mon. 01/25/2021

=begin
The diamond exercise takes as its input a letter, and outputs it in a diamond
shape. Given a letter, it prints a diamond starting with 'A', with the supplied
letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.
Examples

Diamond for letter 'A':
A

Diamond for letter 'C':
  A
 B B
C   C
 B B
  A

Diamond for letter 'E':
    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A

=end

=begin
# Notes
Inputs
  - string with one capitalized letter
Outputs
  - multi-line string (formatted) with letters A..letter in a diamond
Rules/Req's
  - letter position in the alphabet * 2 - 1  = # of chars/row = # of total rows
  -
  -
Questions
  -
  -
Algorithm
  - define a class named Diamond with a make_diamond class method
  - define an array constant with capitalized letters of the alphabet
  - Diamond::make_diamond
    - n = (letter position in the alphabet * 2 - 1)
      = # of chars per row
      = # of total rows
    - external spaces = (# of chars/row - 2)
      - total # of external spaces decreases by 2 on each iteration
    - internal spaces = # of chars per row - external spaces - 2
      - 0 if number is less than 0
    - center the first letter (A) on the # of starting spaces
    - perform (# of total rows iterations + 1) / 2
      - on each iteration calculate the number of external spaces and internal
        spaces
      - letter centered on external spaces if internal spaces = 0
      - letter + internal spaces + letter, centered on external spaces
      - save each string of length n in an array
    - once the halfway point is reached, reverse array and output strings
      skipping the now first string (middle string of the diamond)
      - halfway point for 9 rows = 5
=end

# CODE

# class Diamond
#   ALPHA = ('A'..'Z').to_a

#   def self.make_diamond(letter)
#     n = (ALPHA.index(letter) + 1) * 2 - 1

#     @@ext = (n - 1) / 2
#     @@int = n - @@ext * 2

#     ext_sp = " " * @@ext
#     @@half_diamond = [ext_sp + "A" + ext_sp + "\n"]

#     Diamond.make_middle(n)

#     (@@half_diamond + @@half_diamond.reverse[1..-1]).join
#   end

#   def self.make_middle(n)
#     (n / 2).times do |i|
#       @@ext -= 1
#       ext_sp = " " * @@ext
#       int_sp = " " * @@int
#       str = ext_sp + ALPHA[i + 1] + int_sp + ALPHA[i + 1] + ext_sp
#       @@half_diamond << str + "\n"
#       @@int += 2
#     end
#   end
# end

# puts Diamond.make_diamond('E')


# From RB101-109 Small Problems Medium 1, Problem 5: Diamonds! Further Exploration
# def diamond(n)
#   odd_numbers = (1..(n-2)).select { |x| x.odd?}
#   all_numbers = odd_numbers + [n] + odd_numbers.reverse
#   all_numbers.each do |num_stars|
#     num_spaces = (n - num_stars) / 2
#     if num_stars == 1
#       puts "*".center(n)
#     else
#       puts (" " * num_spaces + "*" +  " " * (num_stars - 2) + "*" + " " * num_spaces)
#     end
#   end
# end

# diamond(5)
# diamond(9)

class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(letter)
    letters = ('A'..letter).to_a + ('A'..letter).to_a.reverse[1..-1]
    n = (ALPHABET.index(letter) + 1) * 2 - 1
    half_diamond = (1..n).select { |x| x.odd? }
    full_diamond = half_diamond + half_diamond.reverse[1..-1]
    full_diamond.each_with_object([]) do |int_sp, rows|
      char = letters.shift
      ext_sp = (n - int_sp) / 2
      if int_sp == 1
        rows << char.center(n) + "\n"
      else
        rows << (" " * ext_sp + char + " " * (int_sp - 2) + char + " " * ext_sp + "\n")
      end
    end.join
  end
end

# puts Diamond.make_diamond('E')
