class SeatsController < ApplicationController

 private

def strong_params
  params.require(:seat).permit(:row, :column)
end
end
