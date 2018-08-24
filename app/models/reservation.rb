class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer
  monetize :amount_cents
end
