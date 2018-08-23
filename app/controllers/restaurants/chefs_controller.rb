class Restaurants::ChefsController < ApplicationController
  before_action :set_chef, only: [:edit, :update, :destroy]

  def index
    @chefs = policy_scope Chef
  end

  def edit
    authorize @chef
  end

  def update
    skip_policy_scope
    @chef.update(chef_params)
    redirect_to restaurants_chefs_path
  end

  def destroy
    skip_policy_scope
    @chef.destroy
    redirect_to restaurants_chefs_path
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :avatar, :profile)
  end


  def set_chef
    @chef = Chef.find(params[:id])
  end

end

