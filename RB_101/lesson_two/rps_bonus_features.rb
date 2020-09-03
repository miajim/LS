# RB101-RB109 Lesson 2
# Rock Paper Scissors: Bonus Features
# Thurs. 09/03/20
# Constants and methods are organized alphabetically by name.

# CONSTANTS -------------------------------------------------------------------
# Hash constant that determine wins (keys beat associated values)
KEY_BEATS_VALUES = {
  "scissors" => ["paper", "lizard"],
  "paper" => ["rock", "spock"],
  "rock" => ["scissors", "lizard"],
  "lizard" => ["paper", "spock"],
  "spock" => ["scissors", "rock"]
}

# Associate yaml file
require 'yaml'
MESSAGES = YAML.load_file('rps_bonus_messages.yml')

# Define number of wins constant
NUM_WINS = 5

# Define rules
RULES = <<-MSG
  Scissors cuts Paper
  Paper covers Rock
  Rock crushes Lizard
  Lizard poisons Spock
  Spock smashes Scissors
  Scissors decapitates Lizard
  Lizard eats Paper
  Paper disproves Spock
  Spock vaporizes Rock
  Rock crushes Scissors
MSG

# Hash constant that defines valid input choices
# (r = rock, p = paper, c = scissors, l = lizard, s = spock)
VALID_CHOICES = {
  'r' => "rock",
  'p' => "paper",
  'c' => "scissors",
  'l' => "lizard",
  's' => "spock"
}

# METHODS -------------------------------------------------------------------
# Ask the user if they want to start the game
def begin_game?
  loop do
    begin_choice = valid_yes_no_quit(messages("begin"))
    if begin_choice == 'y'
      break
    elsif begin_choice =~ /[nq]/
      quit_game()
    end
  end
end

# Ask the user if they want to continue playing
def continue
  quit_game() if valid_yes_no_quit(messages("continue")) =~ /[nq]/
  prompt(messages("dashes"))
end

# Display the "grand winner" of the entire game
def display_grand_winner(scores_hash)
  if scores_hash[:player_score] > scores_hash[:computer_score]
    prompt(messages("user_wins_all"))
  else
    prompt(messages("computer_wins_all"))
  end
end

# Display who won the round
def display_result(player, computer)
  if win?(player, computer)
    prompt("You won this round!\n\n")
  elsif win?(computer, player)
    prompt("Computer won this round!\n\n")
  else
    prompt("It's a tie this round!\n\n")
  end
end

# Generate the computer's choice
def generate_computer_choice
  VALID_CHOICES.values.sample()
end

# Reset user choice each round and ask for input
def let_user_choose
  choice = ''
  loop do
    prompt(messages("request_user_input"), false)
    choice = Kernel.gets().chomp().downcase()
    if VALID_CHOICES.key?(choice)
      choice = VALID_CHOICES[choice]
      break
    elsif VALID_CHOICES.value?(choice)
      break
    elsif (choice == 'q') || (choice == 'quit')
      quit_game()
    else
      prompt(messages("not_valid_input"))
    end
  end
  choice
end

# Display message from assoc. YAML file
def messages(message)
  MESSAGES[message]
end

# Add a pause (if needed), default delay of 1.0 sec
def pause(time = 1.0)
  sleep(time)
end

# Standard output text formatting
def prompt(message, newline = true)
  newline ? Kernel.puts("=> #{message}") : Kernel.print("=> #{message}")
end

# Quit the game
def quit_game
  if valid_yes_no_quit(messages("quit")) =~ /[yq]/
    abort messages("game_ended")
  else # 'n'
    prompt(messages("game_continued"))
  end
end

# Ask the user if they want to see the rules
def read_rules?
  loop do
    rules_choice = valid_yes_no_quit(messages("read_rules"))
    if rules_choice == 'y'
      puts RULES
      break
    elsif rules_choice == 'q'
      quit_game()
    else # otherwise 'n'
      break
    end
  end
end

# Update the score of the player (user, comp) that won the round
def update_score(player, computer, scores_hash)
  if win?(player, computer)
    scores_hash[:player_score] += 1
  elsif win?(computer, player)
    scores_hash[:computer_score] += 1
    # else (i.e., there is a tie) do nothing to the scores
  end
end

# Check validity of user input (must be y/yes/n/no/q/quit, case-insensitive)
def valid_yes_no_quit(question)
  input = ''
  loop do
    prompt(question, false)
    input = gets.chomp.downcase
    break if %w(y yes n no q quit).include?(input)
    prompt(messages("not_valid_input"))
    pause()
  end
  input.chr
end

# Return true if the first argument wins, otherwise returns false
def win?(first, second)
  KEY_BEATS_VALUES[first].include?(second)
end

# MAIN -----------------------------------------------------------------------
# Initialize "count" variable to keep track of the # of rounds
round_num = 0

# Define a hash to keep track of player scores
scores = {
  player_score: 0,
  computer_score: 0
}

# Welcome user to the game and ask if they want to see the rules
prompt(messages("welcome"))
read_rules?()

# Reiterate conditions of the game and ask if the user wants to begin playing
prompt(messages("win_conditions") + "#{NUM_WINS}.")
pause()
begin_game?()

# Explain how to quit the game at any time and "load" the game.
prompt(messages("how_to_quit"))
prompt(messages("loading"))
pause(2.25)
system('clear') # clears the screen before starting rounds

prompt(messages("dashes")) # formatting

# Main outer loop that continues until the player or computer score reaches
# the required number of wins
until (scores[:player_score] == NUM_WINS) ||
      (scores[:computer_score] == NUM_WINS)
  # Ask the user if they want to continue (after they've played
  # at least one round)
  continue() if round_num > 0

  round_num += 1
  # Output the round number
  puts "ROUND NUMBER: #{round_num}"

  # Randomly assign the computer a valid choice
  computer_choice = generate_computer_choice

  # Let the user choose
  choice = let_user_choose()

  # Output user and computer choices to user
  choices_output = <<-MSG
  => You chose: #{choice}
  => Computer chose: #{computer_choice}
  \n
  MSG
  puts choices_output

  # Display who won the round
  display_result(choice, computer_choice)

  # Keep track of the score based on the winner of the round
  update_score(choice, computer_choice, scores)

  # Output current user and computer score to user
  prompt("Player score: #{scores[:player_score]}")
  prompt("Computer score: #{scores[:computer_score]}\n\n")
end

# Output the grand winner
prompt(messages("dashes")) # formatting
display_grand_winner(scores)

# Output the game has ended
prompt(messages("goodbye"))
