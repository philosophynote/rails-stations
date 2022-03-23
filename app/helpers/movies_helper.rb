module MoviesHelper
  def movie_thumbnail(movie)
    thumbnail_url = movie.image_url
    image_tag(thumbnail_url, alt: movie.name, class: "card-img-top")
  end
end
