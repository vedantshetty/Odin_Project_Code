require 'sinatra'
require 'sinatra/reloader'
get '/numberGuesser' do 
  srand rand
  number = rand(100)
  erb :index, :locals =>{:number =>number}
end