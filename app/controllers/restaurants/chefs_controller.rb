class Restaurants::ChefsController < ApplicationController
  def index
    skip_policy_scope
    @chefs = Chef.all
  end

  def edit
    skip_policy_scope
    @chef = Chef.find(params[:id])
  end

  def update
    skip_policy_scope
    @chef = Chef.find(params[:id])
    @chef.update(chef_params)
    redirect_to restaurants_chefs_path
  end

  def destroy
    skip_policy_scope
    @chef = Chef.find(params[:id])
    @chef.destroy
    redirect_to restaurants_chefs_path
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :avatar, :profile)
  end
end
