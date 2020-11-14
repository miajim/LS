=begin
Codewars - Repeated Substring (6 kyu)
Suggested on Christian Larwood's Study Guide
Mon. 10/26/20

For a given nonempty string s find a minimum substring t and the maximum number
k, such that the entire string s is equal to t repeated k times. The input string
consists of lowercase latin letters. Your function should return a tuple (in Python)
(t, k) or an array (in Ruby and JavaScript) [t, k].

Example #1:
for string s = "ababab" the answer is ["ab", 3]

Example #2:
for string s = "abcde" the answer is because for this string "abcde" the minimum
substring t, such that s is t repeated k times, is itself.


# Notes
Inputs
  - one string, all lowercase alphabetical, assume no spaces
Outputs
  - one array, 0th element: string, 1st element: integer
Rules/Req's
  - Find the minium substring t and max number k s.t. s = t * k
  -
  -
Questions
  -
  -
Algorithm
  - iterate through the input str, checking substrings of length 1 to
    the length of the input str
  - check if the substring * (length of str / length of substr) == str
  - if yes, stop and return [t, k]
  - otherwise go to the next iteration
=end

def f(s)
  (0...s.size).each do |i|
    t = s[0..i]
    k = s.size / t.size
    return [t, k] if t * k == s
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
