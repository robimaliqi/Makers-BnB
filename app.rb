require 'sinatra/base'
require 'sinatra/reloader'
require './lib/spaces'
require './database_connection_setup'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end
 
  get '/spaces' do
    @spaces = Spaces.all
    erb :spaces
  end

  post '/spaces/:id' do
    Spaces.book(id: params[:id])
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new/create' do
    Spaces.create(name: params[:name])
    redirect '/spaces'
  end

  run! if app_file == $0
end

# comment something