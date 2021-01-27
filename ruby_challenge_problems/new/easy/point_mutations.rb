# LS Ruby Challenge Problems (New)
# Easy - Problem 2: Point Mutations
# Sat. 01/23/2021

=begin
Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid,
in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to
cause a ripple effect throughout the cell. Although mutations are technically mistakes,
a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects
of evolution are attributable by the accumulated result of beneficial microscopic mutations over many generations.

The simplest and most common type of nucleic acid mutation is a point mutation, which
replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from
different genomes with a common ancestor, we get a measure of the minimum number of
point mutations that could have occurred on the evolutionary path between the two strands.

This is called the Hamming distance.

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length,
you should compute the Hamming distance over the shorter length.
=end

=begin
# Notes
Inputs
  - a string with a combination of letters A, G, C, T, no spaces
Outputs
  - an integer representing the number of letters that differ
Rules/Req's
  - count the number of differences between the strings
  - must use the shorter length string for comparison if two strings
    are unequal in length
Questions
  -
  -
Algorithm
  - create a DNA class with #initialize and #hamming_distance
  - #initialize
    - store input string for comparison
  - #hamming_distance
    - takes one argument(string)
    - initiate a counting variable
    - create a loop from 0...min_str_length
    - compare the two strings character by character
    - increment the counting variable if the characters at the same position
      are not equal
    - return the value of the counting variable
=end

# CODE

class DNA
  def initialize(str1)
    @DNA = str1
  end

  def hamming_distance(str2)
    distance = 0
    min_length = [@DNA.size, str2.size].min
    min_length.times do |i|
      distance += 1 unless @DNA[i] == str2[i]
    end
    distance
  end
end

# dna = DNA.new('ACT')
# p dna.hamming_distance('GGA')