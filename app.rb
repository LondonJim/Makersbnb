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
    @spaces = Space.all
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    flash[:notice] = "Passwords do not match" if params[:password] != params[:password_confirmation]
    session[:current_user] = User.sign_up(
      name: params[:name],
      handle: params[:handle],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    flash[:notice] = session[:current_user].errors.full_messages.to_sentence unless session[:current_user] == nil
    flash[:notice] = "Signup successful, you are now logged in as #{session[:current_user].name}" if session[:current_user] != nil
    redirect '/members_area' if session[:current_user] != nil
    redirect '/signup'
  end

  get '/sign_out' do
    session[:current_user] = nil
    flash[:notice] = "You have signed out, see you again soon!"
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    flash[:notice] = "Already logged in as #{session[:current_user].handle}" if session[:current_user] != nil
    redirect '/login' if session[:current_user] != nil
    session[:current_user] = User.find_by(handle: params[:handle]) if User.login(handle: params[:handle], password: params[:password])
    if session[:current_user] == nil
      flash[:notice] = 'No details held'
      redirect '/login'
    end
    flash[:notice] = "Welcome, #{session[:current_user].handle}"
    redirect '/members_area'
  end

  get '/add_form' do
    erb :add_form
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
    space = Space.find_by(id: session[:space_id])
    space_user_id = space.user_id
    p space_user_id
    p session[:current_user].id
    if session[:current_user].id == space_user_id
      Availability.create(
        space_id: space.id,
        date: params[:date]
        )
        flash[:notice] = "Date successfully added to Space"
    end
    redirect "/space/#{space.id}"
  end

  get '/space/:id' do
    session[:space_id] = params[:id]
    @space = Space.find_or_initialize_by(id: session[:space_id])
    @available_dates = @space.availabilities.map { |a| a.date }
    erb :space
  end

  get '/members_area' do
    @space = Space.where(user_id: session[:current_user].id)
    erb :members_area
  end

  get '/members_area/messages' do
    erb :messages
  end

  run! if app_file == $0
end
