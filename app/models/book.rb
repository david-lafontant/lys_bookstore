class Book < ApplicationRecord
  belongs_to :category
  validates :title, presence: true, length: {minimum: 3, maximum: 100}
  validates :author, presence: true, length: {minimum: 3, maximum: 100} 
end
