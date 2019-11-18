class CinemasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cinemas = Cinema.all
  end

  def show
    @cinema = Cinema.find(params[:id])
  end

  private

  def strong_params
    params.require(:cinema).permit(:name, :address)
  end
end
