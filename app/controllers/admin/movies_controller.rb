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
      flash[:error] = "保存できませんでした"
      render 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:success] = '更新が成功しました！'
      redirect_to admin_movies_path 
    else
      flash[:error] = "保存できませんでした"
      render 'edit'
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:name, :year, :is_showing,
                                   :description,:image_url)
    end
end
