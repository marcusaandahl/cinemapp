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
    @user_seats = getUserSeats(@session)
    puts @user_seats
  end

  # def showtime
  #   @showtime = session.showtime.strptime(dt, '%m/%d/%Y %H:%M')
  # end

  private

  def strong_params
    params.require(:session).permit(:showtime)
  end

  def getUserSeats(session)
    userSeats = []
    current_user.orders.each do |order|
      if order.bookings.first.session_id == session.id
        order.bookings.each do |booking|
          userSeats.push(booking.seat_id)
        end
      end
    end
    return userSeats
  end
end
