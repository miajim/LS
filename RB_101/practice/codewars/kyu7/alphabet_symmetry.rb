=begin
Codewars - Alphabet Symmetry (7 kyu)
Suggested on Christian Larwood's Study Guide
Sun. 10/25/20

Consider the word "abode". We can see that the letter a is in position 1 and b
is in position 2. In the alphabet, a and b are also in positions 1 and 2.
Notice also that d and e in abode occupy the positions they would occupy in the
alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy
their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See  cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

# Notes
Inputs
  - an array of strings
Outputs
  - an array of integers
Rules/Req's
  - input: only alphabet characters, can include uppercase or lowercase letters,
    no spaces
  - the output for each string will correspond to the number of letters in the
    string that are in the same position within the string as their occurrence
    in the alphabet
  - Looks like whether a letter is uppercased or not does not matter in determining
    its position in the alphabet
Questions
  -
  -
Algorithm
  - create an array constant as a reference, containing the letters a..z
  - iterate through the input array (string, one word)
  - downcase the word
    - iterate through the letters in the word (chars)
    - if the index of the current char is equal to the index of the char
      within the array constant, then add one to the count
  - return a count for each string in the input array (map)

=end

ALPHABET = ("a".."z").to_a

def solve(arr)
  arr.map do |word|
    word.downcase!
    count = 0
    word.chars.each_with_index do |char, i|
      count += 1 if i == ALPHABET.index(char)
    end
    count
  end
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]