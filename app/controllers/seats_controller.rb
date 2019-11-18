class SeatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @seats = Seat.all
  end

  def update
    @seat.update(strong_params)

    redirect_to root_path
  end

  private

  def strong_params
    params.require(:seat).permit(:row, :column)
  end
end
