# Guess opponents secret code within a certain number of turns.

# TODO - Create AI that can guess the user generated code
class Mastermind
  def initialize(number = 4, mode = 'codebreaker')
    @code = []
    @colors = ['Red','Green','Blue','Yellow','Black','White']
    @number = number
    case mode
    when 'codebreaker'
      codemaker
    when 'codemaker'
      #input_code
      codebreaker
    end
  end

  def input_code
    puts 'Enter your secret code'
    puts ' Enter you colors through a sequence of their codes'\
    'e.g:5,5,4,6 for Black, Black, Yellow, White'
    @code = input
  end

  def codemaker
    (0...@number).each do |peg|
      @code[peg] = @colors[rand(6)]
    end
    guide_codebreaker
  end

  def begin
    12.times do |index|
      puts "TURN #{index}".center(50,'*')
      user_code = input
      matches = feedback(user_code)
      if win?(matches[0])
        puts 'Congrats!! You are a mastermind. You correctly guessed the code'
        print_code
      end
    end
    lose
  end

  def win?(matches)
    return false unless matches == @number

    true
  end

  def lose
    puts 'Sorry, you ran out of turns'
    puts 'The correct code was'
    print_code
    puts 'Better luck next time:)'
  end

  def print_code
    puts @code.join(', ')
  end

  def illegal(code)
    return false if code.length == @number && code.none?(nil)

    if code.length != @number
      print 'The code length is incorrect'
    else
      print 'One or more of your color codes are wrong'
    end
    puts '. Please try again.'
    true
  end

  def input
    puts 'Enter your code below'
    print_color_codes
    user_code = ''
    loop do
      user_code = gets.chomp.split(',').map do |code|
        @colors[code.to_i - 1] if code.to_i.between?(1, 6)
      end
      break unless illegal(user_code)
    end
    user_code
  end

  def feedback(user_code)
    temp_code = @code.dup
    exact_match = 0
    color_match = 0
    temp_code.each_with_index do |element, index|
      puts user_code[index]
      if element == user_code[index]
        exact_match += 1
        temp_code[index], user_code[index] = nil
      end
    end

    temp_code.each_with_index do |element, index|
      if element
        user_code_index = user_code.index(element)
        if user_code_index
          user_code[user_code_index] = nil
          temp_code[index] = nil
          color_match += 1
        end
      end
    end
    puts "There were #{exact_match} exact matches and #{color_match} color matches"
    [exact_match, color_match]
  end

  def print_color_codes
    puts 'COLORS-->'
    @colors.each_with_index do |color,code|
      puts "#{code+1}: #{color}"
    end
  end

  def guide_codebreaker
    puts 'guide'.upcase.center(50,'*')
    puts "\n1. Enter your colors through a sequences of their codes"
    puts 'e.g: 5,5,4,6 for Black, Black, Yellow, White'

    puts "\n2. Each turn the computer will provide feedback"\
         ' on how close you were to the actual answer'

    puts "\n3. You have 12 turns to correctly guess the code"
    puts ''.center(50, '*')
  end
end

