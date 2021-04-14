# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy 1 - Problem 5: Encrypted Pioneers
# Tues. 01/05/2021

=begin
The following list contains the names of individuals who are pioneers in the
field of computing or that have had a significant influence on the field. The
names are in an encrypted form, though, using a simple (and incredibly weak)
form of encryption called Rot13.

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names .

=end


# Option 1
names = File.read('ex5_text.txt').split("\n")

ALPHABET = ("a".."z").to_a

def rot13(letter)
  current_i = ALPHABET.index(letter)
  ALPHABET[current_i + (current_i < 13 ? 13 : -13)]
end

deciphered = names.map do |name|
  name.chars.map do |letter|
    if ALPHABET.include?(letter.downcase)
      translated_letter = rot13(letter.downcase)
      letter == letter.downcase ? translated_letter : translated_letter.upcase
    else
      letter # special character or space
    end
  end.join("")
end

puts deciphered

# Option 2
names = File.read('ex5_text.txt').split("\n")

ALPHABET = (1..26).zip(("a".."z").zip("A".."Z")).to_h

def find_key(letter)
  ALPHABET.values.each_with_index do |subarr, i|
    return i if subarr.include?(letter)
  end
  nil
end

def decipher(letter, key)
  subkey = ALPHABET[key].index(letter)
  ALPHABET[key <= 13 ? key + 13 : key - 13][subkey]
end

deciphered = names.map do |name|
  name.chars.map do |letter|
    key = find_key(letter)
    key ? decipher(letter, key + 1) : letter
  end.join
end

puts deciphered


# Further Exploration
=begin

=end