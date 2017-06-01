class User < ActiveRecord::Base
    has_many :businesses
    validates_presence_of :username, :password
    validates :username, uniqueness: true
end

class Business < ActiveRecord::Base
  belongs_to :user
end
