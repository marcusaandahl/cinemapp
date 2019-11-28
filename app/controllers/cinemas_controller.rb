class CinemasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :map]

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

    def map
      @cinema = Cinema.find(params[:cinema_id])
      infoWindowPre = render_to_string(partial: "info_window", locals: { cinema: @cinema })
      puts infoWindowPre
      @marker =
        [{
          lat: @cinema.latitude,
          lng: @cinema.longitude,
          infoWindow: infoWindowPre
        }]
    end

    private

    def strong_params
      params.require(:cinema).permit(:name, :address)
    end
end
