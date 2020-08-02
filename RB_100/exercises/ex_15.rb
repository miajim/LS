# Exercises Chapter, Exercise 15
# 7/19/20

# What will the following program output?

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

# The program will output that these hashes are the same, even though the 
# order of the key-value pairs is different and the notation for assigning key-value pairs varies. 