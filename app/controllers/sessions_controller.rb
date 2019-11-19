class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @movie = Movie.find(params[:movie_id])
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
  end

  private

  def strong_params
    params.require(:session).permit(:showtime)
  end
end
