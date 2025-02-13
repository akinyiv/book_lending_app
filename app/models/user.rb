class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true, length: { minimum: 3 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }

    has_many :borrowings, dependent: :destroy
    has_many :borrowed_books, -> { where(borrowings: { returned_at: nil }) }, through: :borrowings, source: :book

    before_save :downcase_email, :strip_name

    private

    def downcase_email
      self.email = email.downcase.strip
    end

    def strip_name
      self.name = name.strip
    end
end
