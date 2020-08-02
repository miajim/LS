# Exercises Chapter, Exercise 11
# 7/19/20

# Given the following data structures, write a program 
# that copies the information from the array into the 
# empty hash that applies to the correct person.

# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}


# Solution 1

contacts.each do |k, v|
  if k == "Joe Smith"
    i = 0
  else 
    i = 1
  end
  
  v[:email] = contact_data[i][0]
  v[:address] = contact_data[i][1]
  v[:phone] = contact_data[i][2]
  
end

p contacts


# Alternative (somewhat refactored) solution

name = contact_data.map { |info| info[0].partition("@").first }

contacts.each do |k, v|
  x = name.index(((k.split(' '))[0].downcase))
  
  k.split(' ').first
  
  v[:email] = contact_data[x][0]
  v[:address] = contact_data[x][1]
  v[:phone] = contact_data[x][2]
  
end

p contacts
