require 'fileutils'
require 'sinatra'
require 'sinatra/base'
<<<<<<< HEAD
require 'sinatra/activerecord'
=======
require './lib/space'
# require './lib/user'
>>>>>>> 1b3aca6f276b0e3e605963438ee09aa4b1481599

if ENV['ENVIRONMENT'] == 'test'
  FileUtils.touch("db/makersbnb_test.sqlite3")
  set :database, { adapter: "sqlite3", database: "./db/makersbnb_test.sqlite3"}
else
  set :database, { adapter: "sqlite3", database: "./db/makersbnb.sqlite3"}
end

<<<<<<< HEAD
require './lib/space'
require './lib/user'
require './lib/message'
require './lib/booking'
require './lib/availability'

class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension
=======
  get '/' do
    erb :index
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/space/:id' do
    @id = params[:id]
    erb :space
  end

  run! if app_file == $0

>>>>>>> 1b3aca6f276b0e3e605963438ee09aa4b1481599
end
