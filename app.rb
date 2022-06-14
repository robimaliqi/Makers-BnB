require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end
 
  get '/spaces' do
    spaces = ["Space_1", "Space_2", "Space_3"]
  end

  run! if app_file == $0
end

# comment something