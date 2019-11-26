class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :components, :checkout]

  def home
    @movies = Movie.all
    @sessions = Session.all
    @cinemas = Cinema.all
  end

  def components
    @movies = Movie.all
  end
end
