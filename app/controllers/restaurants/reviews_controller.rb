class Restaurants::ReviewsController < ApplicationController
  def index
    skip_policy_scope
    @reviews = Review.all
  end
end
