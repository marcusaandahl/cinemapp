class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

private

  def strong_params
    params.require(:movie).permit(:name, :description)
  end
end
