# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :books
  validates :name, presence: true, length: { minimum: 3, maximum: 60 }
end
