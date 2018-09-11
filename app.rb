require 'sinatra/base'
require './lib/space'
# require './lib/user'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  run! if app_file == $0

end
