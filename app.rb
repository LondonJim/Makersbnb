require 'dotenv'
require 'fileutils'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'pg'
require 'sinatra/flash'


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
  register Sinatra::Flash

  enable :sessions

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

    space = Space.find_by(name: params[:name])

    Availability.create(
      space_id: space.id,
      date: params[:date]
      )

      flash[:notice] = "Space successfully added"

    redirect '/'
  end

  post '/spaces/update' do
    space = Space.find_by(name: params[:name_2])
    space_user_id = space.user_id
    if params[:user_id_2] == space_user_id.to_s
      Availability.create(
        space_id: space.id,
        date: params[:date_2]
        )
        flash[:notice] = "Date successfully added to Space"
    end
    redirect '/'
  end

  get '/space/:id' do
    @id = params[:id]
    @space = Space.find_or_initialize_by(id: @id)
    @available_dates = @space.availabilities.map { |a| a.date }
    erb :space
  end

  run! if app_file == $0
end
