require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Welcome to MakersBNB. Feel at home, anywhere"
  end

  run! if app_file == $0
end

# comment something