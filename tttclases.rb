require 'pry'

class Game
  attr_accessor :board, :turn_count
  attr_reader :player1, :player2, :game_type

  def initialize (player1, player2, game_type)
    @board = (1..9).to_a
    @WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @turn_count = 1
    @player1 = player1
    @player2 = player2
    @game_type = game_type

    play
    game_over


  def game_type
    puts `clear`
    puts "Welcome to Tic Tac Toe! Please press (A) for Human vs. Human, or press (B) fro Human vs. Computer."
    result = gets.chomp.upcase
      if result == "A"
        puts "I hope you're both ready for some Tic Tac Toe!"
        game_type = :human_human
        player1_symbol = "X"
        player1 = HumanUser.new(player1_symbol)
        puts "Player 1, you will be X"
        if player1_symbol == "X"
          player2_symbol = "O"
          player2 = HumanUser.new(player2_symbol)
          puts "Player 2, you will be O"
        end
        Game.new(player1, player2, game_type)

      elsif result == "B"
        puts "Let's hope you have what it takes to beat the computer!"
        game_type = :human_comp
        player1_symbol = "X"
        player1 = HumanUser.new(player1_symbol)
        puts "Player 1 you will be X"
        if player1_symbol == "X"
          player2_symbol = "O"
          player2 = CompPlayer.new(player2_symbol)
          puts "The Computer Player will be O"
        end
        Game.new(player1, player2, game_type)
      end

  def play_ttt
    if game_type == :human_human
      human_game
    else
      comp_game
    end
  end

  def game_turns(player, turn_count)
    draw_board
    player = turn_count.odd? ? player1 : player2
    spots_left = @board.select { |x| x.is_a? Integer }
    puts "Please select an available number 1 through 9."
  end

  def human_game
    turn_count = 1
    until done?
      player = turn_count.odd? ? player1 : player2
      location = game_turns(player, turn_count)
      board[location] = player.player_symbol
      turn_count += 1
    end
  end

  def draw_board(board)
    puts "
              #{table[0]}  |  #{table[1]}  |  #{table[2]}
             ---------------
              #{table[3]}  |  #{table[4]}  |  #{table[5]}
             ---------------
              #{table[6]}  |  #{table[7]}  |  #{table[8]}
              "
  end

  # def done?
  #   if self.victor?
  #     game_over
  #   else
  #     game_over
  #   end
  # end

  def game_over
    print_board
    if victor?
      puts "#{self.victor?} is the victor!"
    elsif @turn_count == 10
      puts "Game is a draw."
    end
  end

  def victor?
    @WINS.any? do |x, y, z|
      if (@board[a] == @board[b]) && (@board[b] == @board[c])
        return @board[a]
      end

  end
end

class HumanUser
  attr_accessor :player_symbol
  def initialize (player_symbol)
    @player_symbol = player_symbol
  end
end

def tic_tac_toe_game
  game_type

end



