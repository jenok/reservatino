class ApplicationController < ActionController::Base
  # [...]
  include Pundit
  protect_from_forgery
  # helper_method :current_user
  before_action :should_authenticate_restaurant!
  before_action :should_authenticate_customer!

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :show, :edit, :update, :confirm, :destroy], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :show, :edit, :update], unless: :skip_pundit?

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

end


