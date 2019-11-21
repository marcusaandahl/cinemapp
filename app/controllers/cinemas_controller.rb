class CinemasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
     if params[:query].present?
    sql_query = "name ILIKE :query OR address ILIKE :query"
      @cinemas = Cinema.where(sql_query, query: "%#{params[:query]}%")
  else
    @cinemas = Cinema.all
  end
  end

  def show
    @cinema = Cinema.find(params[:id])
  end

  private

  def strong_params
    params.require(:cinema).permit(:name, :address)
  end
end
