# LS RB139 Exam - Coding Challenge
# Mia Jimenez
# Wed. 01/27/2021

=begin
Write a program that conforms to the above instructions and encrypts text
strings with the following simple (and very unsecure) cipher:

Replace each letter in the original string with another letter.
The first letter of the alphabet should be replaced with the last.
The second letter of the alphabet should be replaced with the next to last.
The third letter of the alphabet should be replace with the second
  from the last.
Continue on in this manner throughout the alphabet.

For example, the word money gets encrypted as nlmvb.

=end

=begin
# Notes
Inputs
  - one string with alphanumeric values, spaces, commas and periods
    - can have uppercase/lowercase letters
Outputs
  - one string with only lowercase letters and spaces, no numbers or punctuation
Test Cases
  - 0 - 12 --> 25 - 13

  - 'no' --> 'ml'
  - 'yes' --> 'bvh'
  - 'OMG' --> 'lnt'
  - 'O M G' --> 'lnt'
  - 'mindb lowin gly' --> 'rnmwy oldrm tob'
  - 'Truth isfic tion.' --> 'gifgs rhurx grlm'
  - 'Testi ng,123, testi ng.' --> 'gvhgr mt123 gvhgr mt'

  ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"]
  ["z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n"]

Rules/Req's
  - match the letter based on the cipher
  - add a space after every 5th letter in the returned cipher
  - ignore spaces in the input string
  - case insensitive
  - ignore punctuation; it doesn't count towards the character count
  - do nothing if it's a number (i.e., the number should map to itself)
    - the number should still count as a character, however
Questions
  -
  -
Algorithm
  - define a class named Cipher with a class method named encode
  - define an array constant with lowercase letters of the alphabet as strings
  - Cipher::encode
    - takes one argument, a string to encode
    - format the input string
      - remove all spaces and punctuation (i.e., remove anything that is not
        an alphanumeric)
      - downcase all characters
    - iterate over every character in the input string (convert to an array),
      mapping each character to a new value and keeping track of the index
      - initialize an local variable to an empty string for keeping track
        of the current character
      - if the index is a multiple of 5, prepend a space to the character
      - if the character is a number
        - return the number
      - if the character is a letter
        - determine its position in the alphabet
        - calculate the position of the corresponding letter based on the rules
          - number of leters in the alphabet - 2
        - return the letter at that index from the array constant
    - join all the characters and return the string
=end

# CODE
class Cipher
  ALPHABET = ('a'..'z').to_a

  def self.encode(str)
    clean_str = Cipher.clean(str)
    clean_str.chars.map.with_index do |char, i|
      current_char = i % 5 == 0 && i != 0 ? " " : ""
      current_char << if char =~ /[0-9]/
                        char
                      else
                        ALPHABET[ALPHABET.size - ALPHABET.index(char) - 1]
                      end
      current_char
    end.join('')
  end

  def self.clean(str)
    str.split(/[^A-Z0-9]/i).join.downcase
  end
end
