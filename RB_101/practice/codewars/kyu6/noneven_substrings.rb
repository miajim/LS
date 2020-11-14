=begin
Codewars - Non-Even Substrings (6 kyu)
Suggested on Christian Larwood's Study Guide
Sun. 10/25/20

Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.

# Notes
Inputs
  - one string, an integer value
Outputs
  - one integer, represents the # of odd-numbered substrings that can be formed
Rules/Req's
  - return the odd-numbered substrings that can be formed
    - From the example, looks like the numbers will always maintain their order
  - Assuming all input strings representing integers will be > 0
  - Looks like odd numbers can be double-counted (i.e., two identical substrings
    count as separate instances)
Questions
  -
  -
Algorithm
  - Initialize a variable to keep track of the number of odd-numbered substrings
  - Generate substrings for the input string
    - Substrings can be as short as one character in length or as long
      as the original input string
  - Evaluate whether or not the substring is an odd-numbered integer
    - if so, add 1 to the count, otherwise continue iteration
  - After iteration, return the total count
=end

# def solve(s)
#   count = 0
#   (0...s.size).each do |start_i|
#     (start_i...s.size).each do |end_i|
#       count += 1 if s[start_i..end_i].to_i.odd?
#     end
#   end
#   count
# end

# Refactored Solution
def solve(s)
  (0...s.size).map do |start_i|
    (start_i...s.size).count { |end_i| s[start_i..end_i].to_i.odd? }
  end.sum
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28