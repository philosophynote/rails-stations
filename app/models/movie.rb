class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :year, presence: true, length: { maximum: 5 }
  validates :description, presence: true
  validates :image_url, format: URI::regexp(%w[http https])

  scope :search_movies, -> (params) do
    return if params.blank?
    movies_name(params).or(movies_description(params)).and(movies_is_showing(params))
  end

  scope :movies_name, -> (params) do
    where( 'name LIKE ? ', params[:keyword]) if params[:keyword].present?
  end
  
  scope :movies_description, -> (params) do
    where( 'description LIKE ?', params[:keyword] ) if params[:keyword].present?
  end

  scope :movies_is_showing, ->(params) do
    where(is_showing: params[:is_showing]) if params[:is_showing].present?
  end
end
