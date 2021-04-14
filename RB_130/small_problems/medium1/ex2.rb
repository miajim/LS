# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Medium 1 - Problem 2: Text Analyzer - Sandwich Code
# Fri. 01/08/2021

=begin
Fill out the rest of the Ruby code below so it prints output like that shown in
"Sample Output." You should read the text from a simple text file that you provide.
(We also supply some example text below, but try the program with your text as well.)


Read the text file in the #process method and pass the text to the block provided
in each call. Everything you need to work on is either part of the #process method
or part of the blocks. You need no other additions or changes.

The text you use does not have to produce the same numbers as the sample output
but should have the indicated format.

class TextAnalyzer
  def process
    # your implementation
  end
end

analyzer = TextAnalyzer.new
analyzer.process { # your implementation }
analyzer.process { # your implementation }
analyzer.process { # your implementation }

Sample output:

3 paragraphs
15 lines
126 words

=end

class TextAnalyzer
  def process
    text = File.read('ex2.txt')
    yield(text)
  end
end

analyzer = TextAnalyzer.new
puts analyzer.process { |text| "#{text.split("\n\n").size} paragraphs"}
puts analyzer.process { |text| "#{text.split("\n").size} lines" }
puts analyzer.process { |text| "#{text.split(" ").size} words" }


# Further Exploration
=begin

=end