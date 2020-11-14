# #Example 1: a1 = ["arp", "live", "strong"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns ["arp", "live", "strong"]

# #Example 2: a1 = ["tarp", "mice", "bull"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns []


# Initial Solution
def in_array(a1, a2)
  a1.each_with_object([]) do |substr, arr|
    a2.each do |str|
      arr << substr if str.include?(substr)
    end
  end.uniq.sort
end

# Refactored Solution
def in_array(a1, a2)
  a1.select {|substr| a2.any? {|str| str.include? substr}}.sort
end

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

p in_array(a1, a2)

a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

p in_array(a1, a2)