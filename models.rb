class User < ActiveRecord::Base
    has_many :things
    has_one :job
    belongs_to :organization
    
    validates_presence_of :username, :password
    validates :username, uniqueness: true
end
