class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validate :email, presence: true, uniqueness: true 
end
