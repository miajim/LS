# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 8
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
Using the each method, write some code to output all of the vowels from the strings.
=end
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
hsh.each do |_, value|
  value.each do |word|
    word.each_char do |char|
      puts char if char.match(/[aeiou]/i)
    end
  end
end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
Similar, but uses a vowels string (vowes = 'aeiou') and #include? to check if the
character is a vowel instead of RegExp
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
