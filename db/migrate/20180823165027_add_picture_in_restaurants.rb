class AddPictureInRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :picture, :string
  end
end
