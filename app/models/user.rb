class User < ActiveRecord::Base
    has_one :profile
    has_many :lists
    has_many :tasks, through: :lists
    validates :username, presence: true, uniqueness: true
    has_secure_password
end
