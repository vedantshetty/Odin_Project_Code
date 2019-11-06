require 'sinatra'
require 'sinatra/reloader' if development?
get '/' do
  encrypted = caesar(params['code'], params['shift'].to_i)
  erb :index, locals: { encrypted: encrypted }
end

def caesar(code, shift)
  return if code.nil? || shift.nil?

  encrypted = ''
  code.each_char do |character|
    base = 97 if lowercase?character

    base = 65 if uppercase?character

    encrypted += if [65, 97]. include? base
                   (((character.ord - base) + shift % 26) % 26 + base).chr
                 else
                   character
                 end
  end
  encrypted
end

def lowercase?(char)
  char.ord >= 97 && char.ord <= 122
end

def uppercase?(char)
  char.ord >= 65 && char.ord <= 90
end
