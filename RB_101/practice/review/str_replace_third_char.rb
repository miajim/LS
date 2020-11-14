# Friday, 10/9/20
# Group study session with Anne

=begin
Have the method letter_changes(str) take the str parameter being passed and
modify it using the following algorithm. Replace every letter in the string
with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
Then return this modified string.
=end

# Examples/Test cases
# p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
# p letter_changes("Road trip9") == "Urdg wuls9"
# p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
# p letter_changes('xyz') == ('abc')

# character could either be alphabetical or non-alphabetical
# non-alphabetical (e.g., punctuation, spacees, symbols, numbers, etc. are not transformed)

=begin
ALGORITHM
- initialize a constant with alphabetical characters (a-z)
- convert the input string into an array of characters
- for each character map a new corresponding character
  - if the character is alphabetical calculate the 3rd letter following, accouting
    for characters at indices 23 and beyond
    - account for character case
  - otherwise the character is non-alphabetical and should not change
- convert the array of characters back into a string with the new chars
=end

ALPHABET = ("a".."z").to_a

def determine_index(char)
  index = ALPHABET.index(char)
  3.times do |_|
    index += 1
    index = 0 if index == 26
  end
  index
end

def letter_changes(str)
 result = str.chars.map do |char|
    lowercase_char = char.downcase
    if ALPHABET.include?(lowercase_char)
      current_char = ALPHABET[determine_index(lowercase_char)]
      char == lowercase_char ? current_char : current_char.upcase
    else
      char
    end
  end
  result.join
end

p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')


# Rona's solution

# keys = ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ').chars
# values = ('defghijklmnopqrstuvwxyzabcDEFGHIJKLMNOPQRSTUVWXYZABC').chars
# ALPHABET_HASH = (keys.zip(values)).to_h

# def letter_changes(string)
#   result = []
#   string.each_char do |char|
#     if ALPHABET_HASH.keys.include?(char)
#       result << ALPHABET_HASH[char]
#     else
#       result << char
#     end
#   end
#   result.join
# end