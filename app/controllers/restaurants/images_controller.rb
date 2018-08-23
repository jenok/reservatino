class Restaurants::ImagesController < ApplicationController
  def index
    skip_policy_scope
    @images = Image.all
  end

  def new
    @image = Image.build
  end

  private

  def image_params
  params.require(:image).permit({image_url: []})
  end
end
