class Admin::MoviesController < ApplicationController
  def index
    @movie = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.valid?
      @movie.save
      flash[:success] = '登録が成功しました！'
      redirect_to admin_movies_path 
    else
      flash[:error] = "クライアントを保存できませんでした"
      render 'new'
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:name, :year, :is_showing,
                                   :description,:image_url)
    end
end
