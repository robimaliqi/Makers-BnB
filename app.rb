require 'sinatra/base'
require 'sinatra/reloader'
require './lib/spaces'

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

  run! if app_file == $0
end

# comment something