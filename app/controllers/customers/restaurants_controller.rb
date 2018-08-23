class Customers::RestaurantsController < ApplicationController
  skip_before_action :should_authenticate_customer!, only: [:index, :show]

  def index
    skip_policy_scope
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

  def show
    skip_policy_scope
    @restaurant = Restaurant.find(params[:id])

    @markers = [{
      lat: @restaurant.latitude,
      lng: @restaurant.longitude
    }]

    # you can ignore this for now. Don't delete it.
    # set a show method and link index restaurant card to each show page
    # once you set this up, go make a view file for this. It will be
    # views/customers/restaurants/show.html.erb
  end

   private

  def equipment_params
    params.require(:restaurant).permit(:category, :name, :cuisine, :city, :category)
  end
end
