=begin
Mon. 11/2/20

Take a Ten Minute Walk (kyu6)

You live in the city of Cartesia where all roads are laid out in a perfect grid.
You arrived ten minutes too early to an appointment, so you decided to take the
opportunity to go for a short walk. The city provides its citizens with a Walk
Generating App on their phones -- everytime you press the button it sends you
an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']).
You always walk only a single block in a direction and you know it takes you one
minute to traverse one city block, so create a function that will return true
if the walk the app gives you will take you exactly ten minutes (you don't want
to be early or late!) and will, of course, return you to your starting point.
Return false otherwise.

Note: you will always receive a valid array containing a random assortment of
direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty
array (that's not a walk, that's standing still!).

# Notes
Inputs
  - one array of strings
Outputs
  - boolean (T/F)
Rules/Req's
  - elements in input array can only be 'n', 's', 'e', 'w'
  - 1 min per block
  - exactly 10 minute walk
    - cannot have more or less than 10 elements in the array
  - must return to your starting point
    - number of 'n' == number of 's' (same for 'e' and 'w')
Questions
  -
  -
Algorithm
  - if the array length is not equal to 10, then return false
  - otherwise check if the number of 'n' == # of 's' AND # of 'e' == # of 'w'
    - if true return true, if false return false
=end

def is_valid_walk(arr)
  return false unless arr.size == 10
  arr.count('n') == arr.count('s') && arr.count('e') == arr.count('w')
end


p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

