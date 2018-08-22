class Restaurants::ReservationsController < ApplicationController
  def index
    skip_policy_scope
    @reservations = Reservation.all
  end
  def show
    skip_policy_scope
    @reservation = Reservation.find(params[:id])
    @customer = Customer.find(@reservation.customer_id)
  end

  def confirm
    skip_policy_scope
    @reservation = Reservation.find(params[:id])
    @reservation.status = "confirm"
    @reservation.save
    redirect_to restaurants_reservations_path
  end

  def update
    skip_policy_scope
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to restaurants_reservations_path
  end

  def reservation_params
    params.require(:reservation).permit(:status)
  end
end

