# LS Ruby Challenge Problems (New)
# Easy - Problem 4: Anagram
# Sun. 01/24/2021

=begin
Write a program that takes a word and a list of possible anagrams and selects
the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists",
"google", "inlets", and "banana", the program should return a list containing
"inlets". Please read the test suite for the exact rules of anagrams.

subject of the anagram: the original word or phrase
=end

=begin
# Notes
Inputs
  - one string, the subject of the anagram(s)
Outputs
  - an array containing zero or more strings representing the anagrams of the
  subject
Rules/Req's
  - not case sensitive, however the anagram cannot match the subject
  - must use every letter in the subject to be a legitimate anagram
  - maintain the case of all strings
Questions
  -
  -
Algorithm
  - create an Anagram class with #initialize and #match
  - # initialize
    - set an instance variable to the argument passed to initialize
  - # match
    - initialize a local variable to point to an array object for keeping track
      of the anagrams
    - downcase the a copy of the subject string for easier comparison
    - convert the subject string to an array of chars, sort the array, then join
      chars to form a string
    - iterate over the array of potential anagrams, performing the same action
      of sorting
    - append the string at the current iteration to the result array if the
      sorted subject is equal to the sorted string
    - return the result array
=end

# CODE

# class Anagram
#   def initialize(str)
#     @subject = str
#   end

#   def match(arr)
#     subject = @subject.downcase.chars.sort.join('') # join isn't necessary
#     arr.each_with_object([]) do |str, anagrams|
#       next if @subject.downcase == str.downcase
#       sorted_str = str.downcase.chars.sort.join('')
#       anagrams << str if subject == sorted_str
#     end
#   end
# end

# detector = Anagram.new('allergy')
# p detector.match(%w( gallery ballerina regally clergy largely leading))

=begin
# Alternative Algorithm
- create a range constant from 'a' to 'z'
- downcase the subject and the current potential anagram (outer loop)
- next potential anagram if they are equal without manipulation
- iterate over the range constant
- check the count for each letter in the subject and pot. anagram
  - if every iteration returns true, then append the current potential
    anagram to a results array
- return the results array

=end

# class Anagram
#   ALPHABET = ('a'..'z')

#   def initialize(str)
#     @subject = str.downcase
#   end

#   def match(arr)
#     arr.each_with_object([]) do |str, anagrams|
#       next if @subject == str.downcase
#       anagrams << str if same_letter_count?(str.downcase)
#     end
#   end

#   private

#   def same_letter_count?(str)
#     ALPHABET.all? { |letter| @subject.count(letter) == str.count(letter) }
#   end
# end

# Algo 2 Further Refactored (use of Array#select)

class Anagram
  ALPHABET = ('a'..'z')

  def initialize(str)
    @subject = str.downcase
  end

  def match(arr)
    arr.select do |str|
      next if @subject == str.downcase
      same_letter_count?(str.downcase)
    end
  end

  private

  def same_letter_count?(str)
    ALPHABET.all? { |letter| @subject.count(letter) == str.count(letter) }
  end
end
