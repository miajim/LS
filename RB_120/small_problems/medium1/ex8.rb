# RB120-RB129 OOP Small Problems
# Medium 1 - Problem 8: Highest and Lowest Ranking Cards
# Wed. 12/9/20

# PROBLEM STATEMENT
=begin
Update this class so you can use it to determine the lowest ranking and highest
ranking cards in an Array of Card objects:

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

For this exercise, numeric cards are low cards, ordered from 2 through 10. Jacks
are higher than 10s, Queens are higher than Jacks, Kings are higher than Queens,
and Aces are higher than Kings. The suit plays no part in the relative ranking
of cards.

If you have two or more cards of the same rank in your list, your min and max
methods should return one of the matching cards; it doesn't matter which one.

Besides any methods needed to determine the lowest and highest cards, create a
#to_s method that returns a String representation of the card, e.g., "Jack of
Diamonds", "4 of Clubs", etc.

=end
# CODE

class Card
  attr_reader :rank, :suit

  RANKING = {
    2 => 1,
    3 => 2,
    4 => 3,
    5 => 4,
    6 => 5,
    7 => 6,
    8 => 7,
    9 => 8,
    10 => 9,
    'Jack' => 10,
    'Queen' => 11,
    'King' => 12,
    'Ace' => 13
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def ==(other_card) # would be more efficient to
    to_s == other_card.to_s
  end

  protected

  def ranking
    RANKING[rank]
  end

  private

  def <=>(other_card)
    ranking <=> other_card.ranking
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]

puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
        Card.new(4, 'Diamonds'),
        Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
        Card.new('Jack', 'Diamonds'),
        Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
        Card.new(8, 'Clubs'),
        Card.new(8, 'Spades')]

puts cards.min.rank == 8
puts cards.max.rank == 8


    # WINNING_LINES.each do |line|
    #   _, marked_squares = classify_squares(line)
    #   line_markers = marked_squares.map(&:marker)
    #   if marked_squares.size == 2 && line_markers.uniq.size == 1
    #     unmarked_index = line[squares.values_at*(line).index(&:unmarked?)]
    #     (line_markers.all?(marker) ? offense : defense) << unmarked_index
    #   end
    # end
  # def classify_squares(line_arr)
  #   square_values = @squares.values_at(*line_arr)
  #   unmarked_squares, marked_squares = square_values.partition(&:unmarked?)
  #   return unmarked_squares, marked_squares
  # end