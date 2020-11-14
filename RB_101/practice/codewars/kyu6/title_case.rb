=begin
Mon. 11/2/20
Tile Case (6 kyu)

A string is considered to be in title case if each word in the string is either
(a) capitalised (that is, only the first letter of the word is in upper case)
or (b) considered to be an exception and put entirely into lower case unless
it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional
list of exceptions (minor words). The list of minor words will be given as a
string with each word separated by a space. Your function should ignore the
case of the minor words string -- it should behave in the same way even if the
case of the minor word string is changed.

# Notes
Inputs
  - one string (words separated by space)
Outputs
  - one string (similar to input string, but w/ 1st letter of each word capitalized
    unless the word is in the "exception" string)
Rules/Req's
  - The first word of the string must always be capitalized (even if it falls
    within the string of exceptions)
  - If a word is an exception, it should be all lowercase
  - Otherwise (all other words) should have the 1st letter capitalized
Questions
  - Assuming only a-Z, A-Z and spaces in the input & output strings
  -
Algorithm
  - define a method title_case with two parameters (str, exc)
  - set the default exceptions parameter to an empty string
  - convert the exception string to an array of words
  - convert the input string to an array of words
  - iterate through the array of words, "transforming" each word based on the
    following logic:
    - if the current word is contained in the exception string and the index (of
      the location of the word) is not 0, then lowercase all chars in the word
    - otherwise capitalize the 1st letter of the word
  - join the new array of words (words separated by space) and return the string
=end


def title_case(str, exc = "")
  exceptions = exc.downcase.split(" ")
  str.split(" ").map.with_index do |word, i|
    exceptions.include?(word.downcase) && i != 0 ? word.downcase : word.capitalize
  end.join(" ")
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
