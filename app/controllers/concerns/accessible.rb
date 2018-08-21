module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_restaurant
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(restaurant_authenticated_root_path) && return
    elsif current_customer
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(customer_authenticated_root_path) && return
    end
  end
end
