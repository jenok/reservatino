class Restaurants::ProfilesController < ApplicationController
  def edit
    skip_policy_scope
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def update
    skip_policy_scope
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    authorize @restaurant
    redirect_to root_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:category, :dresscode, :opening_hours, :style, :cuisine, :tel, :city, :street, :zipcode, :picture)
  end
end
