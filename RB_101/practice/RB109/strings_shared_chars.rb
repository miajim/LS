=begin
# Example 2 from Watch Others Code: Part 1
Wed. 10/21/20

Given an array of strings made only from lowercase letters, return an array
of all characters that show up in all strings within the given array (including
duplicates). For example, if a character occurs 3 times in all strings but not 4
times, you need to include that character 3 times in the final answer.

# PEDAC
Inputs
  - one array of strings
Outputs
  - one array of strings
Rules/Req's
  - strings are only lowercase letters (no spaces, non-alphabetic characters)
  - if a letter appears more than once (n times) in all strings, that letter
    should also appear n times in the output array
  -
Questions
  -
  -
Algo
  - create an array to store the output array
  - iterate through the input array (word)
    - iterate through the word (chars)
    - tally the number each character that appears in the string
      - for each word create an associated hash that stores the character
        as the key and the number of occurrences of that character as the
        corresponding value
  - Iterate through a list of characters that form all the words
      - join all of the words in the input array and find the unique characters
        from this list of characters
      - iterate through this list, checking the corresponding value for the character
        in the hash belonging to each word
  - If the number of a particular character is equal among all the words, then
    append that character n times to the output array
  - return the output array

  - if all of the counts in the array are the same, then append the char to the
    output array
    -
=end

# ORIGINAL SOLUTION
def common_chars(words)
  letter_count = words.map do |word|
    letters = word.chars
    letters.uniq.each_with_object(Hash.new(0)) do |char, hsh|
      hsh[char] += letters.count(char)
    end
  end

  words.join.split("").uniq.each_with_object([]) do |char, result|
    char_counts = letter_count.map { |hsh| hsh[char] }
    result << [char] * char_counts.min if char_counts.all? { |num| num > 0 }
    result.flatten!
  end
end


=begin
- generate a list of unique characters that appear in all of the strings
- iterate through the array of characters
  - iterate through the array of words
  - count the number of times the character appears in the word & store the count
  - if the counts are all greater than zero, append the character n times to output array
- return the output array
=end

# REFACTORED SOLUTION
def common_chars(words)
  unique_chars = words.join.split("").uniq
  unique_chars.each_with_object([]) do |char, result|
    char_count = []
    words.each { |word| char_count << word.count(char) }
    char_count.min.times { |_| result << char } if char_count.all? { |num| num > 0 }
  end
end

# MOST REFACTORED SOLUTION (IN PROGRESS)
# def common_chars(words)
#   # result = {}
#   unique_chars = words.join.split("").uniq
#   unique_chars.select do |char|
#     words.map { |word| word.count(char) }.all? { |num| num > 0 }
#   end

#   # result.select! { |(subarr)| subarr.all? { |num| num > 0} }
#   # result.map { |k, v|
# end




# Eitan's (LS) Solution
# def common_chars(array)
#   array = array.map { |word| word.dup }

#   chars = array.shift.chars

#   chars.select do |char|
#     array.all? { |word| word.sub!(char, "") }
#   end
# end

# Refactor of Eitan's Solution

def common_chars(array)
  array = array.map { |word| word.dup }
  array.shift.chars.select { |char| array.all? { |word| word.sub!(char, "") } }
end
p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []