class RestaurantsController < ApplicationController
  skip_before_action :authenticate_customer!, only: :show

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

end
