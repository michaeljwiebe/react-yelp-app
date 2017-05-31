class User < ActiveRecord::Base
    
    validates_presence_of :username, :password
    validates :username, uniqueness: true
end
