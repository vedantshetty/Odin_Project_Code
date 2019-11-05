require_relative 'tic_tac_toe.rb'

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
