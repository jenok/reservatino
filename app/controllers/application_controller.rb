class ApplicationController < ActionController::Base
  # [...]
  include Pundit
  protect_from_forgery
  # helper_method :current_user
  before_action :should_authenticate_restaurant!
  before_action :should_authenticate_customer!

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :show], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index], unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def should_authenticate_restaurant!
    authenticate_restaurant! if params[:controller] =~ /(^restaurants)/
  end

  def should_authenticate_customer!
    authenticate_customer! if params[:controller] =~ /(^customers)/
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def pundit_user
    if restaurant_signed_in?
      current_restaurant
    elsif customer_signed_in?
      current_customer
    end
  end
end


