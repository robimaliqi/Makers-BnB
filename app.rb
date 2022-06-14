require 'sinatra/base'
require 'sinatra/reloader'
require './lib/spaces'
require './lib/users'

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

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    redirect '/userhomepage'
  end

  get '/userhomepage' do
    Users.create
  end

  run! if app_file == $0
end

# comment something