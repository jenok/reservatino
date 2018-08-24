class Customers::ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new]
  before_action :set_review, only: [:edit]

  def new
    @review = Review.new
    authorize @restaurant
  end

  def create
  end


  private
  def set_restaurant
    @restaurant = current_restaurant
  end

  def set_review
    @review = Review.find(params[:id])
  end
end




  # def index
  #   @reservations = policy_scope Reservation
  # end

  # def show
  #   authorize @reservation
  #   @customer = Customer.find(@reservation.customer_id)
  # end

  # def confirm
  #   @reservation.status = "confirmed"
  #   @reservation.save
  #   redirect_to restaurants_reservations_path
  # end

  # def decline
  #   skip_policy_scope
  #   @reservation.status = "declined"
  #   @reservation.save
  #   redirect_to restaurants_reservations_path
  # end

  # private

  # def set_restaurant
  #   @restaurant = current_restaurant
  # end

  # def set_reservation
  #   @reservation = Reservation.find(params[:id])
  # end

  # def reservation_params
  #   params.require(:reservation).permit(:status)
  # end
