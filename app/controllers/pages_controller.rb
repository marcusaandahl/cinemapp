class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :components]

  def home
  end

  def components
  end
end
