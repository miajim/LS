=begin
# Example 1 from Watch Others Code: Part 1
Wed. 10/21/20

Given a non-empty string, check if it can be constructed by taking a substring
of it and appending multiple copies of the substring together. You may assume
the given string consists of lowercase English letters only.

Example 1:
Input: "abab"
Output: true
Explanation: It's the substring of "ab" twice

Example 2:
Input: "aba"
Output: False

# PEDAC
Inputs
  - one string, no spaces, only lowercase alphabetic characters
Outputs
  - one boolean (T/F)
Rules/Req's
  - input string will be non-empty
  - substring is considered 2 or more characters, (2...length of string)
  - input string is no spaces, only lowercase alphabetic characters
Questions
  - check the substring assumption
  -
Algo
  - generate all substrings from the input string of length 2...length of string
    - from index 0 to index (string length - 2) generate substrings of length 2,
      up to (string length - 1). repeat starting at index 1, etc. up to and
      including index (string length - 2)
    - store substrings in an array and return the array of substrings
  - based on the length of the string and the length of the substring, calculate
    the number of multiples (n) that can be generated from the substring.
    If length of the string % length of the substring == 0
      - check if the substring repeated n times == input string, return T/F
    otherwise, the substring cannot create the input string --> return false
=end

# CODE

# ORIGINAL SOLUTION
def generate_substrings(str)
  substrings = []
  max = str.length - 2
  0.upto(max) do |first|
    (first + 1).upto(str.length - 1) do |last|
      substr = str[first..last]
      substrings << substr if substr.length <= (str.length / 2)
    end
  end
  substrings.uniq
end

# REFACTORED (MORE EFFICIENT) SOLUTION
def generate_substrings(str)
  half = str.length / 2
  (0..half).each_with_object([]) do |start_i, substrings|
    ((start_i + 1)..(start_i + half - 1)).each do |end_i|
      substr = str[start_i..end_i]
      substrings << substr unless substrings.include?(substr)
    end
  end
end


# p get_substrings("abab") == ["a", "ab", "aba", "abab", "b", "ba", "bab", "a", "ab", "b"]
# p get_substrings("aba") == ["a", "ab", "aba", "b", "ba", "a"]

# def repeated_substring_pattern(str)
#   substrings = generate_substrings(str)
#   substrings.each do |substr|
#   n, remainder = (str.length).divmod(substr.length)
#   next if remainder != 0
#   return true if substr * n == str
#   end
#   false
# end

# p generate_substrings("abab") # => ["ab", "aba", "ba", "bab", "ab"]
# p generate_substrings("ababab") # => ["ab", "aba", "ba", "bab"]



# Alternative way of generating substrings (get_substrings)
# This solution assumes a substring can be 1 character long, and generates all
# substrings (even those greater than str.length/2)
def get_substrings(str)
  (0...str.length).each_with_object([]) do |start_i, substrings|
    (start_i...str.length).each do |end_i|
      substrings << str[start_i..end_i]
    end
  end
end

# Eitan's (LS) Solution
# def repeated_substring_pattern(string)
#   substrings = []
#   1.upto(string.size / 2 ) do |num|
#     if (string.size % num == 0)
#       substrings << string[0, num]
#     end
#   end

#   substrings.each do |substring|
#     multiplier = string.size / substring.size
#     return true if substring * multiplier == string
#   end
#   false
# end


# Refactor of Eitan's solution
def repeated_substring_pattern(string)
  (1..string.size / 2).each do |num|
    quo, rem = string.size.divmod(num)
    return true if (string[0, num] * quo) == string if rem == 0
  end
  false
end

=begin
- Find the greatest common multiple of the string
- Use the gcm as the upper limit on substring length
=end

def get_substrings(str)
#   gcm = (str.size / 2).downto(1) { |len| break len if (str.size % len == 0) }
#   (1..gcm).each_with_object([]) { |len, subs| subs << str[0, len] }
# OR
  (1..str.size / 2).each_with_object([]) { |len, subs| subs << str[0, len] if str.size % len == 0}
end

# def get_substrings(str)
#   (1..str.size / 2).each_with_object([]) { |len, subs| subs << str[0, len] }
# end

print "abab    ", get_substrings("abab"), "\n"
print "aba    ", get_substrings("aba"), "\n"
print "aabaaba    ", get_substrings("aabaaba"), "\n"
print  "abaababaab     ", get_substrings("abaababaab"), "\n"
print "abcabcabcabcabc     ", get_substrings("abcabcabcabcabc"), "\n"

# p repeated_substring_pattern("abab") == true
# p repeated_substring_pattern("aba") == false
# p repeated_substring_pattern("aabaaba") == false
# p repeated_substring_pattern("abaababaab") == true
# p repeated_substring_pattern("abcabcabcabcabc") == true
