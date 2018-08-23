class Customers::ReservationsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action :set_reservation, only: [:show, :cancel]

  def index
    @reservations = policy_scope Reservation
  end

  def cancel
    @reservation.status = "canceled"
    @reservation.save
    redirect_to customers_reservations_path
  end

  private

  def set_restaurant
    @restaurant = current_restaurant
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:status)
  end
end



#   def index
#   end

#   def show
#     authorize @reservation
#     @customer = Customer.find(@reservation.customer_id)
#   end

#   def confirm
#     @reservation.status = "confirmed"
#     @reservation.save
#     redirect_to restaurants_reservations_path
#   end

#   def decline
#     skip_policy_scope
#     @reservation.status = "declined"
#     @reservation.save
#     redirect_to restaurants_reservations_path
#   end
