class Restaurants::ProfilesController < ApplicationController
  def edit
    skip_policy_scope
    @restaurant = Restaurant.find(params[:id])
  end

  def update
  end
end
