class TicTacToe
  @@count = 1
  attr_reader :game_over, :turn

  def initialize
    puts " New Game Started - Game #{@@count} ".center(50, '*')
    @board = Hash.new(' ')
    @@count+=1

    @game_over = false
    @turn = 0
    display_board
  end

  def put_x(row, column)
    return false if illegal?(row, column)

    @board[[row, column]] = 'X'
    @turn += 1
    display_board
    game_over?(row, column)
    true
  end

  def put_o(row, column)
    return false if illegal?(row, column)

    @board[[row, column]] = '0'
    @turn += 1
    display_board
    game_over?(row, column)
    true
  end

  def game_over?(row, column)
    winner_symbol = @board[[row, column]]
    @game_over = 'end' if @turn == 9
    @game_over = true if row_complete?(row, winner_symbol) ||
                         column_complete?(column, winner_symbol) ||
                         left_diagonal_complete?(winner_symbol) ||
                         right_diagonal_complete?(winner_symbol)
  end

  private

  def display_board
    (1..3).each do |row|
      (1..3).each do |column|
        print @board[[row, column]] + '|'
      end
      puts ''
    end
  end

  def illegal?(row, column)
    if @board[[row, column]] != ' '
      puts 'That spot has already been marked. Pick another'
      return true

    elsif !(row.between?(1, 3) && column.between?(1, 3))
      puts 'Pick row and column values of between 1 and 3'
      return true
    end
    false
  end

  def left_diagonal_complete?(winner_symbol)
    (1..3).each do |index|
      return false if @board[[index, index]] != winner_symbol
    end
    true
  end

  def right_diagonal_complete?(winner_symbol)
    (1..3).each do |index|
      return false if @board[[index, 4 - index]] != winner_symbol
    end
    true
  end

  def row_complete?(row, winner_symbol)
    (1..3).each do |index|
      return false if @board[[row, index]] != winner_symbol
    end
    true
  end

  def column_complete?(column, winner_symbol)
    (1..3).each do |index|
      return false if @board[[index, column]] != winner_symbol
    end
    true
  end
end

def continue?
  puts 'do you want to continue'
  puts '1.yes'
  puts '2.no'
  play = gets.chomp
  play == '1'
end

def get_input(name)
  puts "#{name}'s turn".center(20, '-')
  puts 'Enter row number and column number(e.g: 1,2)'
  column, row = gets.chomp.split(',')
  [column.to_i, row.to_i]
end

puts 'enter player 1 name'
player1 = gets.chomp
puts 'enter player 2 name'
player2 = gets.chomp
play = true

while play
  game = TicTacToe.new
  loop do
    row, column = get_input(player1)
    row, column = get_input(player1) until game.put_x(row, column)
    if game.game_over
      if game.game_over == 'end'
        puts 'It\'s a tie!'
      else
        puts "#{player1} wins!"
      end
      break
    end

    row, column = get_input(player2)
    row, column = get_input(player2) until game.put_o(row, column)

    if game.game_over
      if game.game_over == 'end'
        puts 'It\'s a tie!'
      else
        puts "#{player2} wins!"
      end
      break
    end
  end
  play = continue?
  player1, player2 = player2, player1
end
