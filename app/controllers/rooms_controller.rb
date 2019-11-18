class RoomsController < ApplicationController
  def index
  end

  def show
  end

  private

  def strong_params
    params.require(:room).permit(:name)
  end
end
