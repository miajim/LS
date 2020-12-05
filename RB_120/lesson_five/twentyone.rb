=begin
RB120-RB129 Lesson 5
Assignment: OO Twenty-One
Sat. 12/5/20
=end

class Participant
  attr_reader :hand, :name

  def initialize(name)
    @name = name
    @total = 0
    @hand = []
  end

  def beats?(other_participant)
    (total > other_participant.total && !busted?) || other_participant.busted?
  end

  def busted?
    total > 21
  end

  def display_busted
    puts ""
    puts "#{name} busted!"
    sleep(1.25)
  end

  def display_score_and_hand
    puts "Current total: #{total}   Current hand: #{format_hand}"
  end

  def format_hand
    hand.map { |card| "#{card.value} of #{card.suit}" }.join(', ')
  end

  def hit(deck)
    deck.deal_to(self)
  end

  def hit_or_stay?
    answer = nil
    loop do
      print "Do you want to hit (h) or stay (s)?: "
      answer = gets.chomp.strip.downcase
      break if %w(h hit s stay).include?(answer)
      puts "Sorry, that's not a valid input. Try again."
    end
    answer
  end

  def reset
    @total = 0
    @hand = []
  end

  def stay
    puts "#{name} chose to stay."
  end

  def total
    temp_total = hand.map(&:points).sum
    num_aces = hand.count { |card| card.value == "A" }
    num_aces.times { |_| temp_total -= 10 if temp_total > 21 }
    @total = temp_total
  end

  def turn(deck)
    loop do
      case hit_or_stay?
      when "hit", "h"
        hit(deck)
        puts "#{name} hit(s)..."
        sleep(1.25)
        display_score_and_hand
        break display_busted if busted?
      when "stay", "s"
        stay
        break
      end
    end
  end
end

class Player < Participant
  private

  def stay
    super
    puts "Dealer plays next..."
    puts ""
    sleep(1.25)
  end
end

class Dealer < Participant
  private

  def hit_or_stay?
    total < 17 ? "hit" : "stay"
  end
end

class Card
  SUITS = [:hearts, :diamonds, :clubs, :spades]
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def points
    case value
    when Integer then value
    when "J", "Q", "K" then 10
    when "A" then 11
    end
  end
end

class Deck
  COMPLETE_DECK = Card::SUITS.product(Card::VALUES)

  def initialize
    @cards = setup
  end

  def deal_to(participant)
    participant.hand << @cards.pop
  end

  def shuffle
    @cards.shuffle!
    puts "Dealer is shuffling the deck..."
    sleep(1.25)
  end

  private

  def setup
    COMPLETE_DECK.map { |suit, value| Card.new(suit, value) }
  end
end

class Game
  private

  def initialize
    @player = Player.new("You")
    @dealer = Dealer.new("Dealer")
    @deck = Deck.new
  end

  attr_reader :player, :dealer, :deck

  def clear_screen
    system('clear')
  end

  def deal_cards(n = 2)
    deck.shuffle
    n.times do |_|
      deck.deal_to(player)
      deck.deal_to(dealer)
    end
  end

  def display_goodbye_message
    puts "Thank you for playing Twenty-One. Goodbye!"
  end

  def display_welcome_message
    puts "Welcome to Twenty-One!"
  end

  def display_winner
    sleep(1.25)
    puts ""
    if dealer.beats?(player)
      puts "#{dealer.name} won the game :("
    elsif player.beats?(dealer)
      puts "#{player.name.upcase} WON THE GAME!"
    else
      puts "The game ended in a tie."
    end
  end

  def main_game
    deal_cards
    show_initial_cards
    player.turn(deck)
    dealer.turn(deck) unless player.busted?
  end

  def play_again?
    choice = ""
    loop do
      puts "Would you like to play again? (y/n)"
      choice = gets.chomp.downcase.strip
      break if %w(y yes n no).include?(choice)
      puts "Invalid input; try again."
    end
    choice.start_with?("y")
  end

  def reset
    player.reset
    dealer.reset
    @deck = Deck.new
  end

  def show_initial_cards
    puts ""
    puts "Your hand: #{player.format_hand}"
    puts "Dealer's visible hand: #{dealer.format_hand.split(',')[0]}"
    puts "You are at: #{player.total}"
    puts ""
  end

  def show_result
    display_winner
    final_results = <<~MSG

    ----------------- FINAL RESULTS -----------------
    Your hand: #{player.format_hand}
    Dealer's hand: #{dealer.format_hand}
    Your total: #{player.total}
    Dealer's total: #{dealer.total}

    MSG
    puts final_results
  end

  public

  def start
    loop do
      clear_screen
      display_welcome_message
      main_game
      show_result
      break unless play_again?
      reset
    end
    display_goodbye_message
  end
end

Game.new.start
