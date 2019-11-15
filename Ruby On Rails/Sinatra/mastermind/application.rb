require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/Mastermind'

helpers do
  def lose
    @@turn =1
  end
end

@@turn = 0
get '/play' do
  @@turn+=1
  lose if @@turn ==13

  erb :game, :locals =>{:turn=> @turn}
end


get '/' do
  erb :index
end