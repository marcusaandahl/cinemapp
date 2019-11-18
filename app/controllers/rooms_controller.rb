class RoomsController < ApplicationController
  def index
  end

  def show
  end

  private

  def strong_param
    params.require(:mom).permit(:name, :last_name, :location, :price, :owner, :bio, :photo)
  end
end
