run bundle after setup

run racksh in Terminal to enter IRB

___________________________________

build/edit tables

rake db:create_migration NAME=create_users_table

class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
      create_table :users do |t|
          t.string :username
          t.string :password
      end
  end
end

update column (:table, :column, :new_type)
change_column(:blogs, :content, :text)

add to table
change_table :table do |t|

rake db:migrate


when
book has_many :tags
tag has_many :books
build a join table for them with integers of ids from both tables
:book_tags do |t|
    t.integer :book_id
    t.integer :tag_id
and build a tags table
    t.string :name

Book has_many :tags, through :books_tags

rake db:drop -- delete all data in tables
rake db:rollback -- remove previous migration

___________________________________

models.rb
class User < ActiveRecord::Base
    belongs_to :crowd
    has_many :books
    has_one :mind

    validates :username, uniqueness: true
    validates :password, presence: true
end

___________________________________

app.rb
before do
    @current_user = User.find(session[:user_id]) if session[:user_id]
end

User.create!(username: params[:username], password: params[:password])

___________________________________
config.ru file

require './config/environment.rb'

run Sinatra::Application

___________________________________
environment.rb

require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:firstdb.sqlite3"
set :sessions, true

require './app'
require './models'

___________________________________

$.ajax({
    method: "GET",
    url: "http://..."
    data: {
        q: term
    },
    dataType: 'json',
    success: function(response){
        console.log(response)
    }
})
