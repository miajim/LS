# RB101-RB109 Lesson 2
# Rock Paper Scissors: Bonus Features - Refactored
# Sun. 09/06/20
# Constants and methods are organized alphabetically by name.

# CONSTANTS -------------------------------------------------------------------
KEY_BEATS_VALUES = {
  "scissors" => ["paper", "lizard"],
  "paper" => ["rock", "spock"],
  "rock" => ["scissors", "lizard"],
  "lizard" => ["paper", "spock"],
  "spock" => ["scissors", "rock"]
}

require 'yaml'
MESSAGES = YAML.load_file('rps_bonus_messages.yml')

NUM_WINS = 5

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

VALID_CHOICES = {
  'r' => "rock",
  'p' => "paper",
  'c' => "scissors",
  'l' => "lizard",
  's' => "spock"
}

# METHODS -------------------------------------------------------------------
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

def continue
  quit_game() if valid_yes_no_quit(messages("continue")) =~ /[nq]/
  prompt(messages("dashes"))
end

def display_choices(player, computer)
  choices_output = <<-MSG
  => You chose: #{player}
  => Computer chose: #{computer}
  \n
  MSG
  puts choices_output
end

def display_grand_winner(scores_hash)
  if scores_hash[:player_score] > scores_hash[:computer_score]
    prompt(messages("user_wins_all"))
  else
    prompt(messages("computer_wins_all"))
  end
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won this round!\n\n")
  elsif win?(computer, player)
    prompt("Computer won this round!\n\n")
  else
    prompt("It's a tie this round!\n\n")
  end
end

def display_scores(scores_hash)
  prompt("Player score: #{scores_hash[:player_score]}")
  prompt("Computer score: #{scores_hash[:computer_score]}\n\n")
end

def generate_computer_choice
  VALID_CHOICES.values.sample()
end

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

def messages(message)
  MESSAGES[message]
end

def pause(time = 1.0)
  sleep(time)
end

def prompt(message, newline = true)
  newline ? Kernel.puts("=> #{message}") : Kernel.print("=> #{message}")
end

def quit_game
  if valid_yes_no_quit(messages("quit")) =~ /[yq]/
    abort messages("game_ended")
  else # 'n'
    prompt(messages("game_continued"))
  end
end

def read_rules?
  loop do
    rules_choice = valid_yes_no_quit(messages("read_rules"))
    if rules_choice == 'y'
      puts RULES
      break
    elsif rules_choice == 'q'
      prompt(messages("not_valid_input"))
    else # otherwise 'n'
      break
    end
  end
end

def someone_won?(scores_hash)
  (scores_hash[:player_score] == NUM_WINS) ||
  (scores_hash[:computer_score] == NUM_WINS)
end

def update_score(player, computer, scores_hash)
  if win?(player, computer)
    scores_hash[:player_score] += 1
  elsif win?(computer, player)
    scores_hash[:computer_score] += 1
    # else (i.e., there is a tie) do nothing to the scores
  end
end

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

def win?(first, second)
  KEY_BEATS_VALUES[first].include?(second)
end

# MAIN -----------------------------------------------------------------------
system('clear') # clears the screen before starting the game

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
prompt(messages("how_to_quit"))
pause()
begin_game?()

# "Load" the game
prompt(messages("loading"))
pause(4.0)

# Main outer loop that continues until the player or computer score reaches
# the required number of wins
until someone_won?(scores)
  # Ask the user if they want to continue (after they've played
  # at least one round)
  continue() if round_num > 0

  system('clear') # clears the screen before starting rounds
  prompt(messages("dashes")) # formatting

  round_num += 1
  # Output the round number
  puts "ROUND NUMBER: #{round_num}"

  # Randomly assign the computer a valid choice
  computer_choice = generate_computer_choice

  # Let the user choose
  choice = let_user_choose()

  # Output user and computer choices to user
  display_choices(choice, computer_choice)

  # Display who won the round
  display_result(choice, computer_choice)

  # Keep track of the score based on the winner of the round
  update_score(choice, computer_choice, scores)

  # Output current user and computer score to user
  display_scores(scores)
end

# Output the grand winner
prompt(messages("dashes")) # formatting
display_grand_winner(scores)

# Output the game has ended
prompt(messages("goodbye"))
