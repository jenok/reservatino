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

end
