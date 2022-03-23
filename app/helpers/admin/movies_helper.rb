module Admin::MoviesHelper
  def movie_showing(movie)
    movie_flag = movie.is_showing
    movie_flag ? "上映中" : "上映予定"
  end
  
end
