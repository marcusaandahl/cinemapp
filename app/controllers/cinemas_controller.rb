class CinemasController < ApplicationController
  def index
    @cinemas = Cinema.all
  end

  def show
    @cinema = Cinema.find(params[:id])
  end

private

  def cinema_params
    params.require(:cinema).permit(:name, :address)
  end
end
