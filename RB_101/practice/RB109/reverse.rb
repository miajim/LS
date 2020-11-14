# Example 1 from Live Session: Beginning Ruby Part 4
# Mon. 10/19/20

# Write a method that takes a string as an argument. Return the string in
# reverse order without using String #reverse!.

=begin
- input: one string
- output: one new string
- traverse the string from the last character to the first & output
- assume that all characters are valid as long as they are String objects.
ALGO
- iterate over the input string from the last character (index: -1) to the
first character (index: -1 * string length),storing each character in a new
string and outputing this string once iteration is complete
=end

def reverse_order(str)
  index = 1
  reversed_str = ""
  loop do
    reversed_str << str[-index]
    index += 1
    break if index > str.length
  end
  reversed_str
end

# test cases
p reverse_order("reverse") == "esrever"
p reverse_order("Hi, there!") == "!ereht ,iH"
p reverse_order("1  2  3") == "3  2  1"