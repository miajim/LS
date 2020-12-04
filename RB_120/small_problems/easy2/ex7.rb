# RB120-RB129 OOP Small Problems
# Easy 2 - Problem 7 : Pet Shelter
# Wed. 11/18/20

# PROBLEM STATEMENT
=begin

Consider the following code:

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

Write the classes and methods that will be necessary to make this code run,
and print the following output:

P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.

The order of the output does not matter, so long as all of the information
is presented.

Further Exploration
Add your own name and pets to this project.

Suppose the shelter has a number of not-yet-adopted pets, and wants to manage
them through this same system. Thus, you should be able to add the following
output to the example output shown above:

The Animal Shelter has the following unadopted pets:
a dog named Asta
a dog named Laddie
a cat named Fluffy
a cat named Kat
a cat named Ben
a parakeet named Chatterbox
a parakeet named Bluebell
   ...

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.
The Animal shelter has 7 unadopted pets.


Can you make these updates to your solution? Did you need to change your class
system at all? Were you able to make all of your changes without modifying the
existing interface?

=end

# CODE

class Shelter

  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet)
    adoptions[owner] = owner.pets << pet  # could create a method within owner that does the RHS
  end

  def print_adoptions
    adoptions.each do |owner, pets|
      if owner.name == "Animal Shelter"
        puts "The #{owner.name} has the following unadopted pets:"
      else
        puts "#{owner.name} has adopted the following pets:"
      end
      pets.each { |pet| puts "a #{pet.animal} named #{pet.name}" }
      puts
    end
  end

  private
  attr_accessor :adoptions
end


class Owner
  attr_reader :name
  attr_accessor :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end
end

class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end
end

# includes Further Exploration
butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

# my pets
chewie       = Pet.new('dog', 'Chewie')
maiden       = Pet.new('chicken', 'Maiden')

# unadopted
asta = Pet.new('dog', 'Asta')
laddie = Pet.new('dog', 'Laddie')
fluffy = Pet.new('cat', 'Fluffy')
kat = Pet.new('cat', 'Kat')
ben = Pet.new('cat', 'Ben')
chatterbox = Pet.new('parakeet', 'Chatterbox')
bluebell = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

# me
mjim = Owner.new('M Jim')

# unadopted
unadopted = Owner.new('Animal Shelter')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

# my pets
shelter.adopt(mjim, chewie)
shelter.adopt(mjim, maiden)

# upadopted
shelter.adopt(unadopted, asta)
shelter.adopt(unadopted, laddie)
shelter.adopt(unadopted, fluffy)
shelter.adopt(unadopted, kat)
shelter.adopt(unadopted, ben)
shelter.adopt(unadopted, chatterbox)
shelter.adopt(unadopted, bluebell)

shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{mjim.name} has #{mjim.number_of_pets} adopted pets."
puts "The #{unadopted.name} has #{unadopted.number_of_pets} unadopted pets."

# My class system didn't need to change, but I did have to add an if-else
# within the Shelter#print_adoptions method to account for the correct wording.