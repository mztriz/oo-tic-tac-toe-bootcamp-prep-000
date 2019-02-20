class TicTacToe

  @@WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
].freeze
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index
    @user_input.to_i - 1
  end
  
  def move
    @board[@index] = @player
  end
  
  def position_taken?(index)
    @board[index] == 'X' || @board[index] == 'O'
  end
  
  def valid_move?
    @index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn
    puts 'Please enter 1-9:'
    @user_input = gets.strip
    @index = input_to_index
    if valid_move?
      move(@board, @index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    @board.count { |token| token == 'X' || token == 'O' }
  end
  
  def current_player
    turn_count.even? ? 'X' : 'O'
  end
  
  def won?(board)
    @@WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      @position_taken?(combo[0])
    end
  end
  
end
