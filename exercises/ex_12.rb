# Exercises Chapter, Exercise 12
# 7/19/20


#Using the hash you created from the previous exercise, 
# demonstrate how you would access Joe's email and Sally's phone number?

# From Exercise 11
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

# Access Joe's email
puts contacts["Joe Smith"][:email]

# Access Sally's phone #
puts contacts["Sally Johnson"][:phone]