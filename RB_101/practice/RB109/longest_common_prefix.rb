=begin
# Example 2 from Watch Others Code: Part 3
Fri. 10/23/20

Write a method to find the longest common prefix string amongst an array of
strings. If there is no common prefix, return an empty string "".

Example 1:
Input: ["flower", "flow", "flight"]
Output: "fl"

Example 2:
Input: ["dog", "racecar", "car"]
Output: ""
Explanation: There is no common prefix among the input strings.

Note: All given inputs are in lowercase letters a-z

# Notes
Inputs
  - an array of strings
Outputs
  - one string, should be the longest PREFIX that appears in all strings
    - i.e., can't be any substring
Rules/Req's
  - If there is no common prefix,  return an empty string
  - All inputs are in lowercase and are part of the alphabet
  - There are no spaces
Questions
  -
  -
Algorithm
  - obtain the first word from the input array
  - iterate over the characters from the first word
  - iterate through the words in the array
  - if the current chacter appears in the same position in all the other words,
    then append the character to the output string
    - break if any of the characters do not match
  - return the matching prefix string
=end

# Initial Solution, mutates the input array
def common_prefix(arr)
  first_word_chars = arr.shift.chars
  prefix = ""

  first_word_chars.each_with_index do |char, i|
    if arr.all? { |word| word[i] == char }
      prefix << char
    else
      break
    end
  end
  prefix
end


# Alternative Solution, does not mutate the input array
def common_prefix(arr)
  (0...arr[0].length).each_with_object("") do |i, prefix|
    if arr[1...arr.length].all? { |word| arr[0][i] == word[i] }
      prefix << arr[0][i]
    else
      break prefix
    end
  end
end

# Jacob's (LS) Solution
# def common_prefix(array)
#   result = []
#   max_index = array.min_by { |string| string.size }.size
#   (0...max_index).each do |index|
#     current_char = array[0][index]
#     if array.all? { |str| str[index] == current_char }
#       result << current_char
#     else
#       return result.join('')
#     end
#   end
#   result.join('')
# end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"