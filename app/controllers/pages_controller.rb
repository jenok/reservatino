class PagesController < ApplicationController
  # skip_before_action :authenticate_user!
  def home
    @restaurants = Restaurant.all
  end
end
