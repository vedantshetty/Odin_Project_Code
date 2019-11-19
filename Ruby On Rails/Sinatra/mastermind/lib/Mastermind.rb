# Guess opponents secret code within a certain number of turns.
class Mastermind
  attr_reader :code, :number
  def initialize(number = 4, mode = 'codebreaker')
    @code = []
    @colors = ['Red','Green','Blue','Yellow','Black','White']
    @number = number
    case mode
    when 'codebreaker'
      codemaker
    when 'codemaker'
      codebreaker
    end
  end

  def codemaker
    (0...@number).each do |peg|
      @code[peg] = @colors[rand(6)]
    end
    puts 'new code'
    puts @code
  end

  def win?(matches)
    return false unless matches == @number

    true
  end

  def feedback(user_code)
    user_code = user_code.dup
    temp_code = @code.dup
    exact_match = 0
    color_match = 0
    temp_code.each_with_index do |element, index|
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
    [exact_match, color_match]
  end
end