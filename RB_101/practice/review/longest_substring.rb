def longest(str)
  length = str.length
  result = ''
  max = []
   str.chars.each_with_index do |_, i|
    str = str[i...length]
    current_char = str[i]
    result << current_char
    str.each_char do |char|
      result << char if char > current_char
      current_char = char
    end
    max = result if result.length > max.length
  end
  max
end

p longest('asd') == 'as'

p longest('nab') == 'ab'

p longest('abcdeapbcdef') == 'abcde'

p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'

p longest('asdfbyfgiklag') =='fgikl'

p longest('z') == 'z'

p longest('zyba') == 'z'