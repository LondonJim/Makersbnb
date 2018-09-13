require 'dotenv'
require 'fileutils'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'pg'
require 'bcrypt'

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

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    flash[:error] = "Passwords do not match" if params[:password] != params[:password_confirmation]
    session[:user] = User.sign_up(
      name: params[:name],
      handle: params[:handle],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    flash[:error] = session[:user].errors.full_messages.to_sentence unless session[:user] == nil
    redirect '/signup'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    session[:current_user] = User.find_by(handle: params[:handle]) if User.login(handle: params[:handle], password: params[:password])
    flash[:error] = 'No details held' if session[:current_user] == nil
    redirect '/login'
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
