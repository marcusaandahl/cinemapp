class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
  end

  private

  def strong_param
    params.require(:session).permit(:showtime)
  end
end
