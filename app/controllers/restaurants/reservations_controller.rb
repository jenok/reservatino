class Restaurants::ReservationsController < ApplicationController
  def index
    skip_policy_scope
    @reservations = Reservation.all
  end

  def history
  end

  def show
    raise
    skip_policy_scope
    @reservation = Reservation.find(params[:id])
    @customer = Customer.find(@reservation.customer_id)
  end

  def edit
    skip_policy_scope
    @reservation = Reservation.find(params[:id])
    @restaurant = current_restaurant
  end

  def update
    skip_policy_scope
    @reservation = Reservation.find(params[:id])
    @restaurant.update(reservation_params)
  end

  def reservation_params
    params.require(:reservation).permit(:status)
  end
end

