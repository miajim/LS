# RB101-RB109 Lesson 6
# Assignment: Twenty-One
# Wed. 09/30/20
# Constants and methods are organized alphabetically by name.

# LOAD GEMS/LIBRARIES-----------------------------------------------------------
require 'pry'
require 'pry-byebug'
require 'yaml'

# CONSTANTS---------------------------------------------------------------------
CARD_SUITS = [:hearts, :diamonds, :clubs, :spades]
CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
MAX = 21

# METHODS-----------------------------------------------------------------------
def busted?(hand)
  total_points(hand) > MAX
end

def card_points(value)
  if value.class == Integer
    value
  elsif value =~ /[JQK]/
    10
  elsif value =~ /A/
    0
  end
end

def compare_scores(user, computer)
  if total_points(user) > total_points(computer)
    puts "YOU WIN WITH #{total_points(user)}!"
  elsif total_points(user) < total_points(computer)
    puts "Dealer wins with #{total_points(computer)}."
  else
    puts "It's a tie!"
  end
end

def deal_n_cards_to(user, remaining_cards, n = 1)
  n.times { user << generate_new_card(remaining_cards)[1] }
end

def dealer_turn(computer, remaining_cards)
  loop do
    if total_points(computer) >= 17
      puts "Dealer stays at #{total_points(computer)}." unless busted?(computer)
      break
    else
      puts "Dealer hits..."
      deal_n_cards_to(computer, remaining_cards)
      puts "Dealers cards are now: #{computer.join(', ')}"
    end
  end
end

def display_current_hand(user, computer)
  puts "Your cards: #{user.join(', ')}"
  puts "Dealer card: #{computer[0]}"
  puts "You are at: #{total_points(user)}"
end

def display_final_result(user, computer)
  puts "Your final cards: #{user.join(', ')} \
        Your final score: #{total_points(user)}"
  puts "Dealer final cards: #{computer.join(', ')} \
        Dealer final score: #{total_points(computer)}"
end

# with deck and hands as an array
def generate_new_card(remaining_cards)
  card = remaining_cards.sample
  remaining_cards.delete(card)
  card
end

def initial_deal(user, computer, deck)
  deal_n_cards_to(user, deck, 2)
  deal_n_cards_to(computer, deck, 2)
end

def newline
  puts "\n"
end

def play_again?
  choice = ""
  loop do
    puts "Would you like to play again? (y/n)"
    choice = gets.chomp.downcase.strip
    %w(y yes n no).include?(choice) ? break : (puts "Invalid input; try again.")
  end
  choice.start_with?("y")
end

def player_turn(user, computer, remaining_cards)
  loop do
    puts "Do you want to hit or stay? : "
    choice = gets.chomp.downcase
    system('clear')
    if choice == 'hit'
      puts "---------------------------------"
      deal_n_cards_to(user, remaining_cards)
      display_current_hand(user, computer)
    end
    break if choice == 'stay' || busted?(user)
    puts "Invalid input; try again." unless choice == 'hit'
  end
end

#  rubocop:disable Metrics/CyclomaticComplexity
def total_points(hand)
  points_without_aces = hand.map { |value| card_points(value) }.reduce(:+)
  num_aces = hand.count("A")
  sum_aces = 0
  case num_aces
  when 1
    sum_aces = (points_without_aces < 11 ? 11 : 1)
  when 2
    sum_aces = (points_without_aces < 10 ? 12 : 2)
  when 3
    sum_aces = (points_without_aces < 9 ? 13 : 3)
  when 4
    sum_aces = (points_without_aces < 8 ? 14 : 4)
  end
  points_without_aces + sum_aces
end
#  rubocop:enable Metrics/CyclomaticComplexity

# MAIN CODE---------------------------------------------------------------------
loop do
  system('clear')

  deck = CARD_SUITS.product(CARD_VALUES)
  player_hand = []
  dealer_hand = []

  puts "Welcome to Twenty-One!"
  initial_deal(player_hand, dealer_hand, deck)
  display_current_hand(player_hand, dealer_hand)

  player_turn(player_hand, dealer_hand, deck)
  if busted?(player_hand)
    system('clear')
    puts "You busted! Dealer wins with #{total_points(dealer_hand)}."
  else
    puts "---------------------------------"
    puts "You chose to stay! Dealer plays next..."
    sleep(1.5)

    newline
    dealer_turn(dealer_hand, deck)
    newline

    if busted?(dealer_hand)
      puts "Dealer busted! YOU WIN WITH #{total_points(player_hand)}!"
    else
      compare_scores(player_hand, dealer_hand)
    end
  end

  display_final_result(player_hand, dealer_hand)

  puts "---------------------------------"
  break unless play_again?
end

puts "Thanks for playing Twenty-One. Goodbye!"
