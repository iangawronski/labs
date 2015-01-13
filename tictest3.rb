require 'set'
require 'pry'

table = [0, 1, 2, 3, 4, 5, 6, 7, 8]
WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]


def menu(table)
  puts `clear`
  puts "Welcome to Tic Tac Toe! Please press A for Human v Human. Press B to play AI on normal difficulty. Press C to play AI on hard difficulty."
  selection = gets.chomp.upcase
    if selection == "A"
      puts "\n\nI hope you're both ready! Player 1 will use X and Player 2 will use O"
      type_of_game(1, table)
    elsif selection == "B"
      puts "\n\nSo you think you can beat me?  Well, let's find out!  Player 1, you will use X."
      type_of_game(2, table)
    else
      puts "\n\nHah! No way you can beat me on hard. Get ready to lose dude! Player 1 you will use X"
      type_of_game(3)
    end
end

def type_of_game(selection, table)
  if selection == 1
    two_player_game(table)
  elsif selection == 2
    player_v_comp(table)
  else
    player_v_comp_hard
  end
end

def two_player_game(table)
  draw_table(table)
  open_squares = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  turn_counter = 1
  while turn_counter < 10 && game_winner?(table) != true
    if turn_counter.even? != true
      open_squares = player_turn(table, open_squares)
      turn_counter += 1
    else
      open_squares = player2_turn(table, open_squares)
      turn_counter += 1
    end
  end
end

def player_v_comp(table)
  draw_table(table)
  open_squares = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  turn_counter = 1
  while turn_counter < 10 && game_winner?(table) != true
    if turn_counter.even? != true
      open_squares = player_turn(table, open_squares)
      turn_counter += 1
    else
      open_squares = comp_turn(table, open_squares)
      turn_counter += 1
    end
  end
end

def player_turn(table, open_squares)
  puts "Pick a number 0 through 8"
  player_pick = gets.chomp.to_i
  open_squares.delete(player_pick)
  put_x(player_pick, table)
  player = "X"
  if game_winner?(table)
    puts "Congrats Player 1, you win!"
  end
  open_squares
end

def player2_turn(table, open_squares)
  puts "Pick a number 0 through 8"
  player_pick = gets.chomp.to_i
  open_squares.delete(player_pick)
  put_o(player_pick, table)
  player = "O"
  if game_winner?(table)
    puts "Congrats Player 2, you win!"
  end
  open_squares
end

def comp_turn(table, open_squares)
  comp_pick = table.select { |x| x.is_a? Fixnum }.sample
  open_squares.delete(comp_pick)
  put_o(player_pick, table)
  player = "O"
  if game_winner?(table)
    puts "The computer's easy mode beat you... You should probably find a new hobby."
  end
  open_squares
end

def put_x(entry, table)
  system `clear`
  table[entry] = "X"
  draw_table(table)
  table
end

def put_o(entry, table)
  system `clear`
  table[entry] = "O"
  draw_table(table)
  table
end

def draw_table(table)
  puts "
              #{table[0]}  |  #{table[1]}  |  #{table[2]}
             ---------------
              #{table[3]}  |  #{table[4]}  |  #{table[5]}
             ---------------
              #{table[6]}  |  #{table[7]}  |  #{table[8]}

              "
end

def game_winner?(table)
  WINS.any? { |a, b, c| table[a] == table[b] && table[b] == table[c] }
end

def game_over(table)
  puts "\n\nWould you like to play again? 'Y' for yes and 'N' for no\n\n"
end

def play_again?(table)
  puts "\n\nWould you like to play again? 'Y' for yes and 'N' for no\n\n"
  yay_or_nay = gets.chomp.upcase
  if yay_or_nay == "Y"
    tic_tac_toe(table)
    play_again?
  else
    exit
  end
end


def tic_tac_toe(table)
  turn_count = 1
  menu(table)
  until game_winner?(table)
  end
  game_over(table)
  play_again?(table)
end

tic_tac_toe(table)


