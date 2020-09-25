# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 2
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?
=end
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# Algorithm
# for every element (hash) in the array, get the values for the published key
# sort the publish keys from smallest (earliest) to largest (lastest)
  # convert the string to an integer before/while sorting
# sort the outer array by this sort

# Code
sorted_books = books.sort_by { |hsh| hsh[:published].to_i }
p sorted_books
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# LS solution is identical, except doesn't convert the strings to integers
# because all strings are 4 characters long (equal comparison)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes