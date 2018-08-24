class Restaurants::ReviewsController < ApplicationController
  def index
    skip_policy_scope
    @reviews = policy_scope Reveiw
    # @reviews = Review.all
  end
end
