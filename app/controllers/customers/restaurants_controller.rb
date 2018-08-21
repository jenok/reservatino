class Customers::RestaurantsController < ApplicationController
  def index
    skip_policy_scope
    @restaurants = Restaurant.all
  end

end
