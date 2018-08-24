class AddPriceToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_monetize :restaurants, :price, currency: { present: false }
  end
end
