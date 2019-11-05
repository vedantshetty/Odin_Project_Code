class Node

  attr_accessor :value, :child, :parent

  def initialize(value = nil, parent = nil, child = nil)
    @value = value
    @parent = parent
    @child = child
  end
end

class KnightMoves
  attr_accessor :board

  def initialize
    @board = [
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " "),
          Array.new(8, " ")
        ]
  end

  def user_input
    puts "\e[H\e[2J"
    draw_the_board
    puts "\t\t\t\tEnter starting position:\tFormat: A4"

    result = get_input
    @start = [result.last, result.first]
    @board[@start[0]][@start[1]] = 's'
    puts "\e[H\e[2J"
    draw_the_board


    puts "\t\t\t\tEnter target position:\tFormat: A4"
    result = get_input
    @target = [result.last, result.first]
    @board[@target[0]][@target[1]] = 'f'
    puts "\e[H\e[2J"
    draw_the_board

    puts "\e[H\e[2J"
    knight_moves
  end

  def get_input
    print "\n\t\t\t\t"
    input = gets.chomp
    until input.size == 2 && input[0].ord.between?(65,72) && input[1].to_i.between?(1,8)
      puts "\t\t\t\tIncorrect input, try again\n\t\t\t\t"
      input = gets.chomp
    end

    letter = input[0].ord - 65
    number = input[1].to_i - 1
    [letter,number]
  end

  def draw_the_board
      @board.reverse.each_with_index do |row, i|
        print "\t\t\t\t #{(i-8).abs}"
        row.each { |x| print "|#{x}" }
        print "|\n"
    end
    letters = ('A'..'H').to_a.join(" ")
    print "\t\t\t\t   #{letters}\n"
  end

  def knight_moves

    found = false
    @queue = []
    @current = Node.new()
    @current.value = @start

    loop do
      x, y = @current.value[0], @current.value[1]
      possible_routes(x,y)

        @routes.each do |route|
          new_node = Node.new([route[0], route[1]], @current)
          @current.child = new_node

            if @board[route[0]][route[1]] == "f"
              print_winning_route(new_node)
              found = true
              break
            end
          @queue << new_node
        end
        break if found
      @current = @queue.shift
    end

  end

  def possible_routes(x,y)
      @routes = []
      a = x +  2; b = y + -1; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x +  1; b = y +  2; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x +  2; b = y +  1; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x + -1; b = y + -2; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x + -2; b = y + -1; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x + -1; b = y +  2; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
      a = x + -2; b = y +  1; @routes << [a,b]  if a.between?(0,7) && b.between?(0,7)
  end

  def print_winning_route(node)
    @route = []

    ## collecting the parents of the winning node
    loop do
      @route << node.value
      break if node.parent == nil
      node = node.parent
    end

    ## updating the board with mid steps
    @route.reverse!
    mid_steps = @route[1..-1]
    mid_steps.to_enum.with_index(1).each do |cords, i|
      @board[cords[0]][cords[1]] = i.to_s
    end

    ## converting route steps to readable form
    string = ""
    @route.each { |step|
      string << "#{(step[1]+65).chr}#{step[0]+1} "
    }
    string.strip!.gsub!(" "," -> ")

    draw_the_board
    puts "\n\t\t\t\tYou made it in #{@route.size - 1} moves!\n\t\t\t\tHere's your path: #{string}\n\n"

  end

end


game = KnightMoves.new
game.user_input





