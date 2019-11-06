require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)
get '/numberGuesser' do
  user_guess = params['guess']
  message = check_guess(user_guess)
  erb :index, locals: { number: NUMBER, message: message }
end

def check_guess(user_guess)
  return '' if user_guess.nil?

  user_guess = user_guess.to_i

  return 'You got it right!' if user_guess - NUMBER == 0

  return  'Too high!' if (user_guess - NUMBER).between?(1,5)

  return 'Too low!' if (user_guess - NUMBER).between?(-1,-5)

  return 'Way too high!' if (user_guess - NUMBER) > 5

  'Way too low!'
end