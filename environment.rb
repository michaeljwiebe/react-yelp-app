require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'json'

set :database, "sqlite3:app.sqlite3"

require './app'
require './models'
