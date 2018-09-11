require 'fileutils'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'

if ENV['ENVIRONMENT'] == 'test'
  FileUtils.touch("db/makersbnb_test.sqlite3")
  set :database, { adapter: "sqlite3", database: "./db/makersbnb_test.sqlite3"}
else
  set :database, { adapter: "sqlite3", database: "./db/makersbnb.sqlite3"}
end

require './lib/space'
require './lib/user'
require './lib/message'
require './lib/booking'
require './lib/availability'

class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    erb :index
  end

  get '/add_form' do
    erb :add_form
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  post '/spaces/create' do
    @owner_id = params[:owner_id]
    @name = params[:name]
    @info = params[:information]
    @location = params[:location]
    @price = params[:price]
    Space.create(owner_id: @owner_id, name: @name, information: @location, price: @price)
    redirect '/spaces'
  end

  get '/space/:id' do
    @id = params[:id]
    erb :space
  end

  run! if app_file == $0


end
