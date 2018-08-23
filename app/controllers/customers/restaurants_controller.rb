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

    @reservation = Reservation.new
    @customer = current_customer
    @reservation.restaurant = @restaurant
    @reservation.customer = @customer

  end

   private

  def equipment_params
    params.require(:restaurant).permit(:category, :name, :cuisine, :city, :category)
  end
end


