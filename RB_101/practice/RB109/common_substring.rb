=begin
Watch Others Code (Part 4)
Example 1 of 2: Common Substring?
Fri. 10/23/20

Given 2 strings, your job is to find out if there is a substring that appears in both strings.
You will return true if you find as substring that appears in both strings, or false if you do not.
We only care about substrings that are longer than one letter long.

ALGO
- guard clause: if either string is empty, return false
- determine which of the two strings is the shorter string
- generate substrings of length from the shorter string
- iterate through the substrings
  - check if the longer string contains the substring
  - return true as soon as one is found
- otherwise return false after iteration

=end

def substring_test(str1, str2)
  return false if str1.empty? || str2.empty?
  str1.downcase!
  str2.downcase!
  if str1.size < str2.size
    shorter_str, longer_str = str1, str2
  else
    shorter_str, longer_str = str2, str1
  end
  (0..(shorter_str.size - 2)).any? { |start_i| longer_str.include?(shorter_str[start_i, 2]) }
end

# Amanda's (LS) Solution
# def substring_test(str1, str2)
#   str1_chars = str1.downcase.chars
#   str2_chars = str2.downcase.chars
#   str1_chars.each_with_index do |char1, idx1|
#     str2_chars.each_with_index do |char2, idx2|
#       return true if char1 == char2 && str1_chars[idx + 1] == str2_chars[idx2 + 1] &&
#       idx1 != (str1_chars.size - 1)
#     end
#   end
#   false
# end

p substring_test('Something', 'Fun') ==  false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true