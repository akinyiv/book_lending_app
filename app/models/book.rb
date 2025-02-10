class Book < ApplicationRecord
    validates :title, :author, :isbn, presence: true
    validates :isbn, uniqueness: true
  
    has_many :borrowings, dependent: :destroy
    has_many :borrowers, through: :borrowings, source: :user
  
    before_save :set_availability
  
    private
  
    def set_availability
      self.available = borrowings.where(returned_at: nil).empty?
    end
  end