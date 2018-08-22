class Customers::RestaurantsController < ApplicationController
  skip_before_action :should_authenticate_customer!, only: [:index, :show]

  def index
    raise
    skip_policy_scope
    @restaurants = Restaurant.all
  end

  def show
    skip_policy_scope # you can ignore this for now. Don't delete it.
    # set a show method and link index restaurant card to each show page
    # once you set this up, go make a view file for this. It will be
    # views/customers/restaurants/show.html.erb
  end
end
