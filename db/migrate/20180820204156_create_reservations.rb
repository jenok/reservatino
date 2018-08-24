class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :time
      t.string :request
      t.string :status, default: "pending", null: false
      t.references :restaurant, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :seats
      t.monetize :amount, currency: {present: false}
      t.json :payment
      t.timestamps
    end
  end
end
