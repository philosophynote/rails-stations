class MoviesController < ApplicationController
    def index
        if params.present?
            @movie = Movie.search_movies(params)
        else
            @movie = Movie.all
        end
    end

    # private

    # def movie_search_params
    #     binding.pry
    #     params.fetch(:search, {}).permit(:keyword, :is_showing)
    # end
end
