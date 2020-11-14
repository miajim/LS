=begin
Example 1 of 1 from Watch Others Code: Part 5
Tues. 10/27/20

Find the length of the longest substring in the given string that is the same in
reverse.

As an example, if the input was "I like racecars that go fast", the substring
(racecar) length would be 7.

If the length of the input string is 0, the return value must be 0.

Example:
"a" --> 1
"aab" --> 2
"abcde" --> 1
"zzbaabcd" --> 4
"" --> 0

# Notes
Inputs
  - one string
Outputs
  - one integer, representing the length of the longest substring
Rules/Req's
  - find the LONGEST substring in a given string
    - substring length could be 0..input string length
  - substring must be the same forwards and backwards
  - If the length of the input string is 0, the return value should be zero
Questions
  - Assuming that non-alphabetic characters (numbers, spaces, punctuation, etc.)
    can count towards the character count in the substring
    - e.g., "I like that racecar in the back." could count as 9 for " racecar "
Algorithm
  - add a guard clause to account for an empty string
  - Generate substrings from the input string
    - Start with the length of the input string and then work backwards, since
      we're looking for the longest substring (once we find the longest, we can
      return the length and stop generating substrings)
    - generate all substrings of length string,
    - generate all substrings of length string - 1,
    - generate all substrings of length string - 2, etc.
  - compare each substring to the reverse of itself
  - if they are equal, return the substring length
=end

def longest_palindrome(str)
  return 0 if str.empty? # this guard clause isn't really necessary
  (str.size).downto(1) do |length|
    (0..str.size-length).each do |start_i|
      substr = str[start_i, length]
      return substr.size if substr == substr.reverse
    end
  end
end

p longest_palindrome("") == 0
p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
p longest_palindrome("I like racecars that go fast") == 7
p longest_palindrome("I like that racecar in the back.") == 9

# Chris' (LS) Solution
def longest_palindrome(string)
  substrings = find_all_substrings(string)
  palindromes = palindromes(substrings)

  max_length = 0
  palindromes.each do |palindrome|
    if palindrome.length > max_length
      max_length = palindrome.length
    end
  end
  max_length
end

def find_all_substrings(string)
  results = []
  0.upto(string.length - 1) do |current_index|
    current_index.upto(str.length - 1) do |second_index|
      results << string[current_index..second_index]
    end
  end
  results
end

def palindromes(substrings)
  results = []
  substrings.each do |substr|
    results << substr if substr == substr.reverse
  end
  results
end