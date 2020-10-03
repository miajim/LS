# RB101-RB109 Lesson 6
# Assignment: Twenty-One Bonus Features
# Thurs. 10/01/20
# Constants and methods are organized alphabetically by name.

# LOAD GEMS---------------------------------------------------------------------
require 'pry'
require 'pry-byebug'

# CONSTANTS---------------------------------------------------------------------
CARD_SUITS = [:hearts, :diamonds, :clubs, :spades]
CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
DEAL_N_CARDS = 2
MAX = 21
PAUSE_SECONDS = 2.5
SHOW_N_DEALER_CARDS = 1
STAY = MAX - 4
VALID_HIT = %w(h hit)
VALID_STAY = %w(s stay)
WIN = 3

# METHODS-----------------------------------------------------------------------
def busted?(hand_total)
  hand_total > MAX
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

def clr_scrn
  system('clear')
end

def continue?(str)
  choice = ""
  loop do
    puts str
    choice = gets.chomp.downcase.strip
    %w(y yes n no).include?(choice) ? break : (puts "Invalid input; try again.")
  end
  choice.start_with?("y")
end

# card suit doesn't really matter to the user, so doesn't need to be output
def deal_n_cards_to(user, remaining_cards, n = 1)
  n.times { user << generate_new_card(remaining_cards)[1] }
end

def dealer_turn(computer, remaining_cards)
  loop do
    computer_total = total_points(computer)
    if computer_total >= STAY
      puts "Dealer stays at #{computer_total}." unless busted?(computer_total)
      divider
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
  puts "Visible dealer cards: #{computer[0, SHOW_N_DEALER_CARDS].join(', ')}"
  puts "You are at: #{total_points(user)}"
end

def display_result(user, computer)
  puts "Your final cards: #{user.join(', ')} \
        Your final total: #{total_points(user)}"
  puts "Dealer final cards: #{computer.join(', ')} \
        Dealer final total: #{total_points(computer)}"
end

def display_scores(scores_hash)
  puts "Your current score: #{scores_hash[:player]}"
  puts "Dealer's current score: #{scores_hash[:dealer]}"
end

def display_winner(user_total, computer_total)
  if user_total > computer_total
    puts "YOU WIN THIS ROUND WITH #{user_total}!"
  elsif user_total < computer_total
    puts "Dealer wins this round with #{computer_total}."
  else
    puts "It's a tie this round!"
  end
end

def divider
  puts "---------------------------------"
end

def generate_new_card(remaining_cards)
  reset!(remaining_cards) if remaining_cards.empty?
  card = remaining_cards.sample
  remaining_cards.delete(card)
  card
end

def grand_winner(scores_hash)
  if scores_hash[:player] == WIN
    "YOU!"
  elsif scores_hash[:dealer] == WIN
    "the dealer."
  end
end

def initial_deal(user, computer, deck)
  deal_n_cards_to(user, deck, DEAL_N_CARDS)
  deal_n_cards_to(computer, deck, DEAL_N_CARDS)
end

def initialize_deck
  CARD_SUITS.product(CARD_VALUES)
end

def newline
  puts "\n"
end

def pause
  sleep(PAUSE_SECONDS)
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
    puts "Do you want to hit or stay? (h/s): "
    choice = gets.chomp.downcase
    if VALID_HIT.include?(choice)
      clr_scrn
      deal_n_cards_to(user, remaining_cards)
      display_current_hand(user, computer)
      divider
    end
    break if VALID_STAY.include?(choice) || busted?(total_points(user))
    puts "Invalid input; try again." unless VALID_HIT.include?(choice)
  end
end

def reset!(remaining_cards)
  CARD_SUITS.product(CARD_VALUES).each { |card| remaining_cards << card }
end

#  rubocop:disable Metrics/CyclomaticComplexity
def total_points(hand)
  points_without_aces = hand.map { |value| card_points(value) }.reduce(:+)
  num_aces = hand.count("A")
  sum_aces = 0
  case num_aces
  when 1
    sum_aces = (points_without_aces < (MAX - 10) ? 11 : 1)
  when 2
    sum_aces = (points_without_aces < (MAX - 11) ? 12 : 2)
  when 3
    sum_aces = (points_without_aces < (MAX - 12) ? 13 : 3)
  when 4
    sum_aces = (points_without_aces < (MAX - 13) ? 14 : 4)
  end
  points_without_aces + sum_aces
end
#  rubocop:enable Metrics/CyclomaticComplexity

def update_scores(user_total, computer_total, scores_hash)
  scores_hash[:player] += 1 if user_total > computer_total
  scores_hash[:dealer] += 1 if user_total < computer_total
end

# MAIN CODE---------------------------------------------------------------------
puts "Welcome to #{MAX}!"
puts "The game continues until either you or the dealer reaches #{WIN} wins."
continue?("Start the game? (y/n)")
scores = { player: 0, dealer: 0 }
deck = initialize_deck

loop do
  clr_scrn

  player_hand = []
  dealer_hand = []

  initial_deal(player_hand, dealer_hand, deck)
  display_current_hand(player_hand, dealer_hand)

  player_turn(player_hand, dealer_hand, deck)
  player_total = total_points(player_hand)
  dealer_total = total_points(dealer_hand)

  if busted?(player_total)
    puts "You busted! Dealer wins this round with #{dealer_total}."
    scores[:dealer] += 1
  else
    divider
    puts "You chose to stay! Dealer plays next..."
    pause
    clr_scrn

    newline

    dealer_turn(dealer_hand, deck)
    dealer_total = total_points(dealer_hand)

    newline

    if busted?(dealer_total)
      puts "Dealer busted! YOU WIN THIS ROUND WITH #{player_total}!"
      scores[:player] += 1
    else
      display_winner(player_total, dealer_total)
      update_scores(player_total, dealer_total, scores)
    end
  end

  display_result(player_hand, dealer_hand)

  divider
  display_scores(scores)
  break if grand_winner(scores)
  unless continue?("Start next round? (y/n)")
    puts "You have #{SECONDS.to_i} seconds before the screen clears & the " \
         "next round starts."
    pause
  end
end

newline
puts "The grand winner is... #{grand_winner(scores)}"
puts "Thanks for playing #{MAX}. Goodbye!"

=begin
# Bonus Features
# Question 1.
In the LS solution, both the player and dealer totals must be calculated right
before the player's turn (initial outer loop) and recalculated after each
respective hit (within a loop). For the player, this could occur on line 98 and
and before line 110, and for the dealer on line 127 and before line 133.

# Question 2.
The last call to play_again? in the LS solution resets the deck, whereas the
other two calls continue using the remaining available cards. My original
solution used only one call to play_again? because I had assumed that if the
user wanted to play again, the deck would have to be reset to contain all
52 cards. Now my code is written to use the same deck for each round and only
initialize the deck if the current deck is empty or the file is run again from
the start.

# Question 3.
You could create a method called compare_cards that contains the content in
lines 145-148 and call it before display_results and play_again? (e.g., before
line 119, before line 138, and on line 145 replacing lines 145-148).

# Question 4.
Implemented above.

# Question 5.
Implemented above.
=end
