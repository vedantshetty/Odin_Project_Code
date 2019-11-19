require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'lib/Mastermind'
enable :sessions

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
  if (session[:turns] >= 13 && session[:matches][-1][0] != session[:game].number)
    erb :game, :locals =>{:turn => session[:turns],:codes => session[:colors], :matches => session[:matches], :answer => session[:game].code}
  else
    erb :game, :locals =>{:turn => session[:turns], :codes => session[:colors], :matches => session[:matches]}
  end
end


get '/' do
  erb :index
end