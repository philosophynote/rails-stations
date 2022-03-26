class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :year, presence: true, length: { maximum: 5 }
  validates :description, presence: true
  validates :image_url, format: URI::regexp(%w[http https])
end
