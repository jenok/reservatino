class Restaurants::MenusController < ApplicationController

  def index
    skip_policy_scope
    @menus = Menu.all
  end

  def edit
    skip_policy_scope
    @menu = Menu.find(params[:id])
  end

  def update
    skip_policy_scope
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to restaurants_menus_path
  end

  def destroy
    skip_policy_scope
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to restaurants_menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :price, :image)
  end

end
