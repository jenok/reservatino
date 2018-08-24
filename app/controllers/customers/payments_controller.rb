class Customers::PaymentsController < ApplicationController
    before_action :set_reservation

    def new
      skip_authorization
      # @payment = Customer::Payment.new
      # authorize @payment
    end

    def create
      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )
      cheat = 100
      charge = Stripe::Charge.create(
        customer:     customer.id,   # You should store this customer id and re-use it.
        amount:       cheat,
        description:  "Payment for reservation #{@reservation.id}",
        currency:     @reservation.amount.currency
      )

      @reservation.update(payment: charge.to_json, status: 'paid')
      authorize @reservation
      redirect_to customers_reservations_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_customers_restaurant_reservation_payment_path(@reservation)
    end

  private

    def set_reservation
      @reservation = current_customer.reservations.where(status: 'pending').find(params[:reservation_id])
    end
end

