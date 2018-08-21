class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer
  belongs_to :offer
  belongs_to :review
end
