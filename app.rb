require 'sinatra'
require 'dawidl022_palindrome'

get '/' do
  @title = 'Home'
  erb :index
end

get '/about' do
  @title = 'About'
  erb :about
end

get '/palindrome' do
  @title = 'Palindrome Detector'
  erb :palindrome
end

post '/check' do
  @phrase = params[:phrase]
  @title = 'Palindrome Result'
  erb :result
end
