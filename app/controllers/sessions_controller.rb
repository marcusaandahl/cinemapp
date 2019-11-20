class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
    @movie = @session.movie
    @room = @session.room
    @cinema = @room.cinema
  end

  private

  def strong_params
    params.require(:session).permit(:showtime)
  end
end
