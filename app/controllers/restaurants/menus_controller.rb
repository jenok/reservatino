class Restaurants::MenusController < ApplicationController
  before_action :set_menu, only: [:edit, :update, :destroy]

  def index
    @menus = policy_scope Menu
  end

  def edit
    authorize @menu
  end

  def update
    skip_policy_scope
    @menu.update(menu_params)
    redirect_to restaurants_menus_path
  end

  def destroy
    skip_policy_scope
    @menu.destroy
    redirect_to restaurants_menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :price, :image)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end
