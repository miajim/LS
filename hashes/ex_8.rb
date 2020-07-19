# Hashes Chapter, Exercise 8
# 7/18/20 

# Given the array
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          

# Write a program that prints out groups of words that are anagrams.
# Anagrams are words that have the same exact letters in them but in a different order.

# sort each individual word alphabetically
alpha_words = words.map { |word| word.chars.sort.join }

# create an array of unique words
unique_words = alpha_words.uniq
 


# grouped_words = []
# unique_words.each { |x| grouped_words.push([]) }

# i = j = k = 0

# determine the indices of identical values and save the original values
# at those indices in a new array

# unique_words.each do |unique_word|
#   alpha_words.each do |alpha_word|
#     if alpha_word == unique_word
#       grouped_words[i][k] = words[j]
#       k += 1
#     end
#     j +=1
#   end 
#   i += 1
#   j = 0 
#   k = 0
# end


# using a for loop

# for unique_word in unique_words do 
#   for alpha_word in alpha_words do
#     if alpha_word == unique_word
#       grouped_words[i][k] = words[j]
#       k += 1
#     end
#     j +=1
#   end 
#   i += 1
#   j = 0 
#   k = 0
# end

# grouped_words.each { |group| p group }


# Refactored
j = 0
unique_words.each do |unique_word|
  grouped_words = []
  alpha_words.each do |alpha_word|
    if alpha_word == unique_word
      grouped_words.push(words[j])
    end
    j +=1
  end 
  j = 0 
  p grouped_words
end

# LS Solution (a lot simpler, uses hashes)

result = {}
words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end 
end 

result.each_value do |v|
  puts " ------"
  p v
end