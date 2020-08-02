# LS Ruby Basics Exercise - Loops 2: Empty the Array
# 7/30/20 

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
	puts names.shift
  break if names == []    # or --> break unless names != []
end

# Further Exploration
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.pop
  break if names.empty?
end