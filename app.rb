require 'sinatra'
require './models/post'

get '/' do
  @posts = Post.all
  erb :index
end

post '/posts' do
  title = params[:title]
  post = Post.new(title: title)
  post.save
  redirect '/', 303
end

get '/health_check' do
  'ok'
end
