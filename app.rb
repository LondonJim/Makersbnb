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
    if params[:password] != params[:password_confirmation]
      flash[:notice] = "Passwords do not match"
      redirect '/signup'
    elsif User.find_by(handle: params[:handle]) != nil
      flash[:notice] = "Username has already been taken"
      redirect '/signup'
    elsif User.find_by(email: params[:email]) != nil
      flash[:notice] = "Email has already been taken"
      redirect '/signup'
    else
      session[:current_user] = User.sign_up(
        name: params[:name],
        handle: params[:handle],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      )
    end

    flash[:notice] = session[:current_user].errors.full_messages.to_sentence if session[:current_user] != nil
    flash[:notice] = "Signup successful, you are now logged in as #{session[:current_user].name}" if session[:current_user] != nil
    redirect '/members_area' if session[:current_user] != nil
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

    if User.find_by(handle: params[:handle]) != nil
      session[:current_user] = User.find_by(handle: params[:handle]) if User.login(handle: params[:handle], password: params[:password])
    end

    if session[:current_user] == nil
      flash[:notice] = 'No details held'
      redirect '/login'
    end

    flash[:notice] = "Welcome, #{session[:current_user].handle}"
    redirect '/members_area'
  end


  get '/spaces/create' do
    erb :add_form
  end

  post '/spaces/create' do
    Space.create(
      user_id: session[:current_user].id,
      name: params[:name],
      info: params[:info],
      location: params[:location],
      price: params[:price]
      )
      flash[:notice] = "Space successfully added"
    redirect '/members_area'
  end

  post '/spaces/update' do
    space = Space.find_by(id: session[:space_id])
    space_user_id = space.user_id
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

    if session[:current_user] == nil
      flash[:notice] = "Sign in to view dates"
      redirect '/'
    end

    session[:space_id] = params[:id]
    @space = Space.find_or_initialize_by(id: session[:space_id])

    if session[:current_user] != nil
      @real_owner = true if @space.user_id == session[:current_user].id
    else
      @logged_in = true
    end

    @available_dates = @space.availabilities.map { |a| a.date }
    erb :space
  end

  get '/members_area' do
    @space = Space.where(user_id: session[:current_user].id)
    erb :members_area
  end

  get '/members_area/messages' do
    spaces = Space.find_each.select { |s| s.user_id == session[:current_user].id }
    @messages = []
    space_ids = spaces.map { |s| s.id }
    space_ids.each { |s| @messages << Message.find_each.select { |m| m.space_id == s } }
    @messages.flatten!
    erb :messages
  end

  post '/members_area/messages/new' do
    Message.new_message(
      user_id: session[:current_user].id,
      space_id: session[:space_id],
      dates: params[:dates],
      status: false
    )
    flash[:notice] = "Booking Message Sent"
    redirect '/members_area'
  end

  run! if app_file == $0
end
