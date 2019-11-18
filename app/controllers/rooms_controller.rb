class RoomsController < ApplicationController
  def index
  end

  def show
  end

  private

  def strong_param
    params.require(:room).permit(:name)
  end
end
