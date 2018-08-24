class RemovePicturesInRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :pictures
  end
end
