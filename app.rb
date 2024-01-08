require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/spaces'
require './database_connection_setup'
require_relative './lib/user'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions

  get '/' do
    erb :'home/index'
  end

  post '/user/new' do
    User.create(email: params[:email], password: params[:password])
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash[:notice] = 'Please check your email or password'
      redirect('/sessions/new')
    end
  end

  get '/spaces' do
    @spaces = Spaces.all
    erb :'spaces/spaces'
  end

  post '/spaces/:id' do
    Spaces.book(id: params[:id])
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new/create' do
    Spaces.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/spaces'
  end

  get '/sessions/end' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0
end