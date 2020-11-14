=begin
Codewars - Return Substring Instance Count (7 kyu)
Suggested on Christian Larwood's Study Guide
Thurs. 10/22/20

Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

# PEDAC
Inputs
  - two strings: one full string, one "substring"
Outputs
  - one integer
Rules/Req's
  - return the number of times the search_text is found in the full_text
  -
  -
Questions
  - Assuming non-alphabetic characters are treated as alphabetic characters
  - Assuming the search is case-insensitive; therefore should convert all characters
    to the same case
Algorithm
  - downcase both input strings
  - generate substrings of the full_text that are the same length as the search_text
  - iterate through the list of substrings and compare to the search_text
  - count if substring == search_text
  - return the count after iteration
=end

def get_substrings(str, sub_len)
  (0..(str.size - sub_len)).each_with_object([]) do |start_i, substrings|
    substrings << str[start_i, sub_len]
  end
end

# # p get_substrings('abcdeb', 1)
# # p get_substrings('abcdeb', 2)
# # p get_substrings('abcdeb', 3)

# def solution(full_text, search_text)
#   full_text.downcase!
#   search_text.downcase!

#   count = 0
#   get_substrings(full_text, search_text.size).each do |substring|
#     count += 1 if substring == search_text
#   end
#   count
# end


# REFACTORED
def solution(full_text, search_text)
  count = 0
  (0..(full_text.size - search_text.size)).each do |i|
    count += 1 if (full_text[i, search_text.size] == search_text)
  end
  count
end

def solution(full_text, search_text)
  full_text.scan(search_text)#.size
end

p solution('abcdeb','b') #== 2
p solution('abcdeb', 'a') #== 1
p solution('abbc', 'bb') #== 1