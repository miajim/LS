# RB101-RB109 Small Problems
# Easy 1 - Problem 4: How Many?
# Mon. 08/24/20

# PROBLEM STATEMENT
# Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# count_occurrences(vehicles)
# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

=begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  array
Outputs 
  unique words and number of unique words 
Rules/Implicit Requirements
  Words in array are case-sensitive.
  Assuming array will be 1D (i.e., not nested).
  Array elements will only be strings.
  Empty array elements will not be counted.
Clarifying Questions
Mental Model (optional)
  Determine the number of unique elements in a given array and report their occurence.

EXAMPLES/TEST CASES
  See above 

DATA STRUCTURE
Inputs
  array
Rules
  output can be a hash (key-value pairs)

ALGORITHM
  define method 'count_occurences'
  define an empty hash
  loop through the values in the array
  if the value is unique, create an associated key in the hash and set the value equal to 1
  if the value is not unique (i.e., it already exists in the hash), augment the value associated with the existing key by 1 
  output key value pairs after the entire array has been traversed 
=end

# CODE
# def count_occurrences(ary)
#   words = Hash.new
#   ary.each do |word|
#     if words.has_key?(word)
#       words[word] += 1 
#     else
#       words[word] = 1
#     end
#   end
# puts words
# # formatted output 
# words.each {|word, occurrences| puts "#{word} => #{occurrences}"}
# end

# count_occurrences(vehicles)
# Further Exploration
# Try to solve the problem when words are case insensitive. e.g., "suv" == "SUV". 

vehicles2 = [
  'car', 'Car', 'truck', 'caR', 'SUV', 'truck',
  'motorcycle', 'MOTORcycle', 'CAR', 'tRUck'
]


def count_occurrences(ary)
  words = Hash.new
  ary.each do |word|
    word.downcase!
    if words.include?(word)
      words[word] += 1 
    else
      words[word] = 1
    end
  end
puts words
# formatted output 
words.each {|word, occurrences| puts "#{word} => #{occurrences}"}
end

count_occurrences(vehicles2)