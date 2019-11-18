class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
  end

  private

  def strong_params
    params.require(:session).permit(:showtime)
  end
end
