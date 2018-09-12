require 'dotenv'
require 'fileutils'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'pg'
require 'simple_calendar'


if ENV['ENVIRONMENT'] == 'test'
  uri = URI.parse(ENV["URL_TEST"])
  ActiveRecord::Base.establish_connection(adapter: 'postgresql', host: uri.host, username: uri.user, password: uri.password, database: uri.path.sub('/', ''))
else
  uri = URI.parse(ENV["URL"])
  ActiveRecord::Base.establish_connection(adapter: 'postgresql', host: uri.host, username: uri.user, password: uri.password, database: uri.path.sub('/', ''))
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
    Space.create(
      user_id: params[:user_id],
      name: params[:name],
      info: params[:info],
      location: params[:location],
      price: params[:price]
      )
      Availability.create(
        space_id: Space.last.id,
        date: params[:date]
      )
    redirect '/spaces'
  end

  get '/space/:id' do
    @id = params[:id]
    @space = Space.find_or_initialize_by(id: @id)
    @available_dates = @space.availabilities.map { |a| a.date }
    erb :space
  end

  run! if app_file == $0
end
