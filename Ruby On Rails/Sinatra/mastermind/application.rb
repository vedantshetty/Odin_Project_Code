require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/Mastermind'
enable :sessions
helpers do
  def lose
  end
end

get '/play' do

  if params['color1']
   session[:colors].push([params['color1'],params['color2'],params['color3'],params['color4']])
    session[:matches].push(session[:game].feedback(session[:colors][-1]))
    session[:turns]+=1
  else
    session[:turns] = 1
    session[:colors] =[]
    session[:matches] = []
    session[:game] = Mastermind.new
  end
  #Write Code for running out of turn
  erb :game, :locals =>{:turn => session[:turns], :codes => session[:colors], :matches => session[:matches]}
end


get '/' do
  erb :index
end