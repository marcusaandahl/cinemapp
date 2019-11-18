class CinemasController < ApplicationController
<<<<<<< HEAD
    def index
=======
  def index
>>>>>>> 8c2082c6cbd6898aa219158cc647814a273b3222
    @cinemas = Cinema.all
  end

  def show
    @cinema = Cinema.find(params[:id])
  end

private
<<<<<<< HEAD
=======

>>>>>>> 8c2082c6cbd6898aa219158cc647814a273b3222
  def cinema_params
    params.require(:cinema).permit(:name, :address)
  end
end
