class Event < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :reservations

enum event_status: { waiting_deposit: 0, payment_confirmation: 1, in_production: 2, preparing_ship: 3, shipped_items: 4 }

end
