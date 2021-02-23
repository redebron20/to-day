class User < ActiveRecord::Base
    has_one :profile
    has_many :lists
    has_many :tasks, through: :lists
    has_secure_password
    validates :password, length: {in: 4..20}
    validates :username, presence: true, uniqueness: true, length: {in: 3..20}
end
