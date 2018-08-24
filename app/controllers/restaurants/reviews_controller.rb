class Restaurants::ReviewsController < ApplicationController
  def index
    skip_policy_scope
    @reviews = policy_scope Review
    # @reviews = Review.all
  end
end
