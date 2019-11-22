class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :components, :checkout]

  def home
  end

  def checkout
  end

  def components
    @movies = Movie.all
  end
end
