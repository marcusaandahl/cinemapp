class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
        @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all

    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def strong_params
    params.require(:movie).permit(:name, :description)
  end
end
