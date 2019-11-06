require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)
get '/numberGuesser' do
  user_guess = params['guess']
  message = check_guess(user_guess)
  cheat = params['cheat'] == 'true'
  erb :index, locals: { number: NUMBER, message: message, cheat_mode: cheat }
end

def check_guess(user_guess)
  return '' if user_guess.nil?

  user_guess = user_guess.to_i

  return 'You got it right!' if user_guess - NUMBER == 0

  return  'Too high!' if (user_guess - NUMBER).between?(1,5)

  return 'Too low!' if (user_guess - NUMBER).between?(-5,-1)

  return 'Way too high!' if (user_guess - NUMBER) > 5

  'Way too low!'
end