# LS Ruby Challenge Problems (New)
# Easy - Problem 9: Beer Song
# Sun. 01/24/2021

=begin
Write a program that can generate the lyrics of the 99 Bottles of Beer song.
See the test suite for the entire song.
=end

=begin
# Notes
Inputs
  -
Outputs
  -
Rules/Req's
  -
  -
  -
Questions
  -
  -
Algorithm
  - define a class called BeerSong
  - define three class methods: verse, verses, and lyrics
  - BeerSong::verse(n)
    - takes one argument, n (must be in the range 0..99)
    - guard clause: raise an argument error if n < 0 or n > 99
    - use case statement for value of n
    - if n = 1
      - # (n-1) => 'no'
    - if n = 0
      - return the following string:
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.
    - returns the following string: "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
      "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
  - BeerSong::verses(*nums)
    - takes one or more arguments, nums
    - call BeerSong::verse n times (once for each argument)
  - BeerSong lyrics
    - call BeerSong::verses((0..99).to_a.reverse)
=end

# CODE
class BeerSong
  def self.verse(n)
    return "Not a valid verse number." unless (0..99).include?(n)
    verses = []
    num = n

    x = num
    take_down_num = "one"
    phrase1 = "#{x} bottle"
    phrase2 = "Take #{take_down_num} down and pass it around, #{phrase1}"

    2.times do |idx|
      verse = case num
      when -1
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      when 0
        x = "No more"
        take_down_num = "it"
        ["#{phrase1}s", "#{phrase2}s" ][idx]
        ["No more bottles of beer on the wall, no more bottles of beer.\n",
        "Take it down and pass it around, no more bottles of beer on the wall.\n"][idx]
      when 1
        [phrase1, phrase2][idx]
        # ["1 bottle of beer on the wall, 1 bottle of beer.\n",
        # "Take one down and pass it around, 1 bottle of beer on the wall.\n"][idx]
      else
        ["#{phrase1}s", "#{phrase2}s"][idx]
      # ["#{num} bottles of beer on the wall, #{num} bottles of beer.\n",
      # "Take one down and pass it around, #{num} bottles of beer on the wall.\n"][idx]
      end
      # verses << verse
      verses << ["#{verse} of beer on the wall, #{verse} of beer.\n",
                  "#{verse} of beer on the wall.\n"][idx]
      num -= 1
    end
    verses.join("")
  end



  def self.verses(num1, num2)
    unless num1 > num2
      return "The first argument must be greater than the second argument."
    end
    all_verses = []
    (num1).downto(num2) { |num| all_verses << BeerSong.verse(num) }
    all_verses.join("\n")
  end

  def self.lyrics
    BeerSong.verses(99, 0)
  end
end

=begin
# n = 3
"3 bottles of beer on the wall, 3 bottles of beer.\n" \
"Take one down and pass it around, 2 bottles of beer on the wall.\n"

# n = 2
"2 bottles of beer on the wall, 2 bottles of beer.\n" \
"Take one down and pass it around, 1 bottle of beer on the wall.\n"

# n = 1
"1 bottle of beer on the wall, 1 bottle of beer.\n" \
"Take it down and pass it around, no more bottles of beer on the wall.\n"

# n = 0
"No more bottles of beer on the wall, no more bottles of beer.\n" \
"Go to the store and buy some more, 99 bottles of beer on the wall.\n"
=end
