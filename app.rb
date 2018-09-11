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
end
