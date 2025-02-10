class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
    has_many :borrowings, dependent: :destroy
    has_many :borrowed_books, through: :borrowings, source: :book
end
