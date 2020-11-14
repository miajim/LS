=begin
Mon. 11/2/20

Stop gninnipS My sdroW! (6 kyu)

Write a function that takes in a string of one or more words, and returns the
same string, but with all five or more letter words reversed
(Just like the name of this Kata). Strings passed in will consist of only letters
and spaces. Spaces will be included only when more than one word is present.

Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

# Notes
Inputs
  - a string w/ one or more words
Outputs
  - a string w/ the same words as the input string, except words with 5+ letters
    should be reversed
Rules/Req's
  - spaces are included only when > 1 word is in the string
  - punctuation is considered part of the word & counts towards word count
  - case should be maintained
  - assume that only a-z, A-Z, spaces, and puncutation will be included and
    a word will be treated as anything between spaces (unless 1st or last word)
Questions
  -
  -
Algorithm
  - find the words in the input string
    - split the string at spaces, returning an array of words only
  - iterate through the array of words
  - if the current word is 5 or more chars in length, the word should be
    "transformed" to it's reversed state
  - otherwise return the current word
  - join the results of the output array with a space to create a string
  - return the string
=end

def spinWords(str)
  str.split.map { |word| word.size >= 5 ? word.reverse : word }.join(" ")
end


p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test"
p spinWords("This is another test") == "This is rehtona test"
p spinWords("test") == "test"
