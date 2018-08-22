class AddPicturesToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :pictures, :json
  end
end
