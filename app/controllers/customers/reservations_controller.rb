class Customers::ReservationsController < ApplicationController
  before_action :set_restaurant, only: [:show, :create]
  before_action :set_reservation, only: [:show, :cancel]

  def index
    @reservations = policy_scope [:customer, Reservation]
  end

  def show
    @reservation = current_customer.orders.where(state: 'paid').find(params[:id])
  end

  def cancel
    authorize [:customer, @reservation]
    @reservation.status = "canceled"
    @reservation.save
    redirect_to customers_reservations_path
  end

  def create
    @reservation = Reservation.new
    @reservation.status = "pending"
    @reservation.customer = current_customer
    @reservation.restaurant = @restaurant
    # @reservation.restaurant.price = restaurant.price,
    authorize [:customer, @reservation]
    if @reservation.save
      redirect_to customers_reservations_path
    else
      @markers = [{
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
      }]

      render "customers/restaurants/show"
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
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
