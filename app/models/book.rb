class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :published_date, presence: true
end