# RB101-RB109 Small Problems
# Easy 5 - Problem 8: Alphabetical Numbers
# Thurs. 09/17/20

# PROBLEM STATEMENT
=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

Further Exploration
Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?

For an extra challenge, rewrite your method to use Enumerable#sort (unless you already did so).

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  - an array of integers
Outputs
  - an array of integers
Rules/Implicit Requirements
  - the input array can be in any order, with a minimum length of 0 and a maximum length of 20
  - the order of the input array doesn't necessarily have to be in ascending/descending order
Clarifying Questions
  - Can you start with an array the ordered numbers as a constant? (Probably not)
Mental Model (optional)
EXAMPLES/TEST CASES

DATA STRUCTURE
Inputs
Rules

ALGORITHM
# define an array constant with the English word for each number as a string
# take the input array and sort s.t. the array is numerically ascending
# use the input array to dictate which indices in the English word array are to be kept
# pair the input array with the English word array constant
# sort the paired array by the strings
# return the "last" (i.e., numeric) value in the paired array as the final sorted array

=end

# CODE
ENGLISH_NUMBERS = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

def alphabetic_number_sort(ary)
  ary.sort_by { |num| ENGLISH_NUMBERS[num] }
end

# Further Exploration
# Option 1
def alphabetic_number_sort(input_ary)
  actual_numbers = input_ary.sort
  result = actual_numbers.each_with_object([]) do |num, string_nums|
    string_nums << ENGLISH_NUMBERS[num]
  end
  result.zip(actual_numbers).sort.map {|subary| subary.last}
end

# Option 2
def alphabetic_number_sort(input_ary)
  sorted_nums = ENGLISH_NUMBERS.sort.each_with_object([]) { |word, sorted_nums| sorted_nums << ENGLISH_NUMBERS.index(word) }
  sorted_nums.keep_if { |sorted_num| input_ary.include?(sorted_num) }
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

# my own test cases
p alphabetic_number_sort((1..5).to_a) == [5, 4, 1, 3, 2]
p alphabetic_number_sort([12, 7, 8, 14, 19]) == [8, 14, 19, 7, 12]

# sort the english numbers array constant alphabetically
# create the sorted index array based on this
# iterate through the sorted index array and keep if the value appears in the input array

