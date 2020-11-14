# Example 2 from Live Session: Beginning Ruby Part 4
# Mon. 10/19/20

=begin
- input: hash with 3 k-v pairs (:price_min, :price_max, :q)
- output: array with hash elements; hash elements will have 2 k-v pairs
- rules: array with hash elements (PRODUCTS constant)
- within the PRODUCTS array, we want to select the elements (hashes) that meet
  the criteria of the input hash
ALGO
- iterate over the products array
  - if the :name value contains the :q value AND
  - the :price value is <= :price_max and >= :price_min
  - then select the hash
- output the selected hashes
=end

PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 700 },
  { name: "Macbook Pro", price: 600 },
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 }
]


query1 = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: "dell"
}

# INITIAL SOLUTION
# def search(query)
#   by_brand = PRODUCTS.select { |info_hsh| info_hsh[:name].downcase.include?(query[:q]) }
#   by_brand.select { |info_hsh| (info_hsh[:price] <= query[:price_max]) && (info_hsh[:price] >= query[:price_min]) }
# end

# REFACORED-ISH SOLUTION
def search(query)
  PRODUCTS.select do |info_hsh|
    brand = info_hsh[:name].downcase
    price = info_hsh[:price]
    target_brand = query[:q]
    price_range = (query[:price_min]..query[:price_max])
    brand.include?(target_brand) && price_range.include?(price)
  end
end

p search(query1)
# [ { name: "Thinkpad x220", price: 250 }]

p search(query2)
# [ { name "Dell Inspiron", price: 300 },
#   { name: "Dell Inspiron", price: 450} ]
