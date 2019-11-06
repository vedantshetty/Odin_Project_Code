require 'sinatra'
require 'sinatra/reloader'
get '/numberGuesser' do 
  srand rand
  number = rand(100)
  "The SECRET NUMBER is #{number}"
end