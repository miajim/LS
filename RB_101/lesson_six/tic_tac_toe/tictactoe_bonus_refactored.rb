# RB101-RB109 Lesson 6
# Tic-Tac-Toe: Bonus Features
# Tues. 09/29/20
# Constants and methods are organized alphabetically by name.

# LOAD GEMS/LIBRARIES-----------------------------------------------------------
require 'yaml'
require 'pry'

# CONSTANTS---------------------------------------------------------------------
COMPUTER_MARKER = "O"
FIRST_MOVE = "choose"
INITIAL_MARKER = " "
MESSAGES = YAML.load_file('tictactoe_messages.yml')
MIDDLE_SQ = 5
NUM_WINS = 3
PLAYER_MARKER = "X"
SPACES = (1..9)
VALID_INPUTS = %w(y n)
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
# METHODS-----------------------------------------------------------------------
def alternate_player(current_player)
  current_player == "player" ? "computer" : "player"
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def computer_places_piece!(brd)
  square = find_at_risk_square(brd)
  brd[square] = COMPUTER_MARKER
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'You'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, scores_hash)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}."
  puts "Your score: #{scores_hash[:player_score]}   " \
       "Computer score: #{scores_hash[:computer_score]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def display_board_spaces(scores_hash)
  display_board(initialize_board, scores_hash)
end

def display_winner(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won this round! \n\n"
  else
    prompt "It's a tie this round! \n\n"
  end
end

def display_who_goes_first(current_plyr)
  if current_plyr == 'computer'
    puts "#{current_plyr.capitalize} will go first this round."
  else
    puts "You will go first this round."
  end
  sleep(1.0)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def find_at_risk_square(brd)
  offense = find_available_squares(brd, COMPUTER_MARKER)
  defense = find_available_squares(brd, PLAYER_MARKER)
  return offense.sample unless offense.empty?
  return defense.sample unless defense.empty?
  return MIDDLE_SQ if brd[MIDDLE_SQ] == INITIAL_MARKER
  empty_squares(brd).sample
end

def find_available_squares(brd, marker)
  squares = []
  WINNING_LINES.each do |line|
    current_spaces = brd.values_at(*line)
    one_blank = (current_spaces.count(INITIAL_MARKER) == 1)
    if current_spaces.count(marker) == 2 && one_blank
      squares << line[current_spaces.find_index(INITIAL_MARKER)]
    end
  end
  squares
end

def initialize_board(marker = "")
  new_board = {}
  SPACES.each do |num|
    marker = num unless marker == INITIAL_MARKER
    new_board[num] = marker
  end
  new_board
end

def joinor(arr, separator = ', ', last_word = 'or')
  if arr.length > 2
    last_word += ' '
    arr[0..-2].join(separator) + separator + last_word + arr[-1].to_s
  else
    arr.join(" #{last_word} ")
  end
end

def max_wins_reached(scores_hash)
  (scores_hash[:player_score] == NUM_WINS) ||
    (scores_hash[:computer_score] == NUM_WINS)
end

def place_piece!(brd, current_player)
  if current_player == "player"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def play_again?
  validate_answer("play_again")
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}): "
    square = gets.chomp
    break if square.length == 1 && empty_squares(brd).include?(square.to_i)
    prompt MESSAGES["invalid_answer"]
  end
  brd[square.to_i] = PLAYER_MARKER
end

def prompt(msg)
  puts "=> #{msg}"
end

def quit_or_continue()
  if validate_answer("continue") == 'n'
    prompt MESSAGES["quit_game"] rescue SystemExit
    exit
  end
end

def someone_won?(brd) # return a true boolean not an incidental boolean
  !!detect_winner(brd)
end

def update_score(brd, scores_hash)
  case detect_winner(brd)
  when 'You' then scores_hash[:player_score] += 1
  when 'Computer' then scores_hash[:computer_score] += 1
  end
end

def validate_answer(message)
  answer = ""
  loop do
    prompt MESSAGES[message]
    answer = gets.chomp.downcase
    break if VALID_INPUTS.include?(answer)
    prompt MESSAGES["invalid_answer"]
  end
  answer
end

def we_have_a_winner(scores_hash)
  if scores_hash[:player_score] == NUM_WINS
    "YOU!"
  elsif scores_hash[:computer_score] == NUM_WINS
    "COMPUTER :("
  end
end

def who_goes_first?(user)
  if user == "choose"
    validate_answer("choose_first_move") == "y" ? "player" : "computer"
  else
    user
  end
end
# MAIN CODE---------------------------------------------------------------------
prompt MESSAGES["welcome"]
prompt format(MESSAGES["rules"], num_wins: NUM_WINS)
prompt MESSAGES["explain_spaces"]
quit_or_continue

loop do
  scores = { player_score: 0, computer_score: 0 }
  loop do
    display_board_spaces(scores)
    board = initialize_board(INITIAL_MARKER)
    current_player = who_goes_first?(FIRST_MOVE)
    display_who_goes_first(current_player)

    loop do
      display_board(board, scores)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    update_score(board, scores)
    display_board(board, scores)
    display_winner(board)

    break if we_have_a_winner(scores)
    prompt MESSAGES["next_round"]
    sleep(3.0)
  end
  prompt format(MESSAGES["overall_winner"], winner: we_have_a_winner(scores))
  break if play_again? == 'n'
end

prompt MESSAGES["goodbye"]
# END---------------------------------------------------------------------------
