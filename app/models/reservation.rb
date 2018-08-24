class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer
  # amount :monetize
  # payment :jsonb
  # monetize :amount_cents
end
