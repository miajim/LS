=begin
RB120-129
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

  def busted?
    total > 21
  end

  def display_busted(other_participant)
    puts ""
    puts "#{name} busted! #{other_participant.name} win(s) with " \
         "#{other_participant.total}."
  end

  def display_hand
    hand.map { |card| "#{card.value} of #{card.suit}" }.join(', ')
  end

  def hit(card)
    hand << card
    puts "Current score: #{total}   Current hand: #{display_hand}"
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
    self.hand = []
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

  private

  attr_writer :hand, :name
end

class Player < Participant
  def stay
    super
    puts "Dealer plays next..."
    puts ""
  end
end

class Dealer < Participant
  def initialize(name)
    super
    @deck = Deck.new
  end

  def deal
    deck.deal
  end

  def reset
    super
    deck.cards = deck.setup
  end

  def shuffle
    puts "Dealer is shuffling the deck..."
    sleep(1.5)
    deck.shuffle
  end

  private

  attr_reader :deck
end

class Card
  SUITS = [:hearts, :diamonds, :clubs, :spades]
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

  attr_accessor :suit, :value

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
  attr_accessor :cards

  def initialize
    @cards = setup
  end

  def deal
    cards.pop
  end

  def setup
    COMPLETE_DECK.map { |suit, value| Card.new(suit, value) }
  end

  def shuffle
    cards.shuffle!
  end
end

class Game
  private

  def initialize
    @player = Player.new("You")
    @dealer = Dealer.new("Dealer")
  end

  attr_reader :player, :dealer

  def clear_screen
    system('clear')
  end

  def deal_cards
    dealer.shuffle
    2.times do |_|
      player.hand << dealer.deal
      dealer.hand << dealer.deal
    end
  end

  def dealer_turn
    loop do
      if dealer.total < 17
        puts "Dealer hits..."
        sleep(1.75)
        dealer.hit(dealer.deal)
        break dealer.display_busted(player) if dealer.busted?
      else
        dealer.stay
        break
      end
    end
  end

  def display_goodbye_message
    puts "Thank you for playing Twenty-One. Goodbye!"
  end

  def display_welcome_message
    puts "Welcome to Twenty-One!"
  end

  def display_winner
    puts ""
    if dealer.total > player.total
      puts "#{dealer.name} won the game :("
    elsif dealer.total < player.total
      puts "#{player.name.upcase} WON THE GAME!"
    else
      puts "The game ended in a tie."
    end
  end

  def main_game
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn unless player.busted?
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

  def player_turn
    loop do
      case player.hit_or_stay?
      when "hit", "h"
        player.hit(dealer.deal)
        break player.display_busted(dealer) if player.busted?
      when "stay", "s"
        player.stay
        break
      end
    end
  end

  def reset
    player.reset
    dealer.reset
  end

  def show_initial_cards
    puts ""
    puts "Your hand: #{player.display_hand}"
    puts "Dealer's visible hand: #{dealer.display_hand.split(',')[0]}"
    puts "You are at: #{player.total}"
    puts ""
  end

  def show_result
    display_winner unless player.busted? || dealer.busted?
    final_results = <<~MSG

    ----------------- FINAL RESULTS -----------------
    Your hand: #{player.display_hand}
    Dealer's hand: #{dealer.display_hand}
    Your score: #{player.total}
    Dealer's score: #{dealer.total}

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
