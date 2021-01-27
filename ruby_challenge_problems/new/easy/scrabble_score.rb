# LS Ruby Challenge Problems (New)
# Easy - Problem 1: Triangles
# Sat. 01/23/2021

=begin
Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

You'll need the following tile scores:

Letter	Value
A, E, I, O, U, L, N, R, S, T	=> 1
D, G	=> 2
B, C, M, P	=> 3
F, H, V, W, Y	 => 4
K	 => 5
J, X	=> 8
Q, Z	=> 10
How to Score

Sum the values of all the tiles used in each word. For instance, lets consider
the word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E

Thus, to compute the final total (14 points), we count:
3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14
=end

=begin
# Notes
Inputs
  - typically a string, but could be nil
Outputs
  - integer, representing the score of each word
Rules/Req's
  - if not a string or is a string but doesn't contain A-Z, a-z then the
    score should be 0
  - case insensitive
  -
Questions
  -
  -
Algorithm
  - define a class called Scrabble with #initialize and #score
  - define a hash constant with letters as keys and scores as values
    - keys: array w/ string letters
    - values: integers representing value of the letters in the array
  - #initialize
    - take one parameter
  - #score
    - guard clause: return 0 if the parameter is not a string or it is a string
      but contains other characters besides A-Z or a-z
    - initialize a local variable to keep track of the total score
    - iterate over the keys in the hash
      - iterate over each key (array of strings)
      - count the # of occurrences of each letter in the word
      - multiply the # of occurrences by the value and add to the running total
    - return the total score
=end

# CODE

class Scrabble
  POINTS = {
    %w(A E I O U L N R S T)	=> 1,
    %w(D G)	=> 2,
    %w(B C M P)	=> 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X)	=> 8,
    %w(Q Z)	=> 10
  }
  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    return 0 unless @word.is_a?(String) && @word.match(/^[a-z]+$/i)
    @word.upcase!
    word_score = 0
    POINTS.each_pair do |letters, point|
      word_score += letters.map { |letter| @word.count(letter) * point }.sum
    end
    word_score
  end
end
