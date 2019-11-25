class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @movie = Movie.find(params[:movie_id])
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
    @movie = @session.movie
    @room = @session.room
    @cinema = @room.cinema
    @seats = @room.seats
  end

  # def showtime
  #   @showtime = session.showtime.strptime(dt, '%m/%d/%Y %H:%M')
  # end

  private

  def strong_params
    params.require(:session).permit(:showtime)
  end
end
