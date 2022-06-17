require 'sinatra/base'
require 'sinatra/reloader'
require './lib/spaces'
require './database_connection_setup'
require_relative 'lib/user'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/user' do
    User.create(email: params[:email], password: params[:password])
    redirect '/user/new'
  end

  get '/user/new' do
    erb :'user/new'
  end

  get '/spaces' do
    @spaces = Spaces.all
    erb :spaces
  end

  post "/spaces/:id" do
    Spaces.book(id: params[:id])
    redirect "/spaces"
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new/create' do
    Spaces.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_to: params[:available_to])
    redirect '/spaces'
  end

  run! if app_file == $0
end

# comment something
