class PagesController < ApplicationController
  # skip_before_action :authenticate_user!
  def home
    @restaurants = Restaurant.all

    if params[:query].present?
      @restaurants = Restaurant.where.not(latitude: nil, longitude: nil).search_by_name(params[:query])
    else
      @restaurants = Restaurant.where.not(latitude: nil, longitude: nil)
    end
    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
      }
    end
  end
end
