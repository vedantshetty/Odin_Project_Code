require 'sinatra'
require 'sinatra/reloader'

@@number = rand(100)
@@guesses = 5

get '/numberGuesser' do
  @@guesses -= 1
  user_guess = params['guess']
  message = check_guess(user_guess,@@number)
  if message == 'You got it right!'
    reset
  elsif @@guesses == 0
    message = "You lost. The number was #{@@number}! A new Number has been generated"
    reset
  end
  cheat = params['cheat'] == 'true'
  erb :index, locals: { number: @@number, message: message, cheat_mode: cheat, 
                        turns:@@guesses }
end

def reset
  @@number = rand(100)
  @@guesses = 5
end

def check_guess(user_guess,number)
  return '' if user_guess.nil?

  user_guess = user_guess.to_i

  return 'You got it right!' if (user_guess - number).zero?

  return  'Too high!' if (user_guess - number).between?(1, 5)

  return 'Too low!' if (user_guess - number).between?(-5, -1)

  return 'Way too high!' if (user_guess - number) > 5

  'Way too low!'
end
