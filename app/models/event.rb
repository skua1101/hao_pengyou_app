class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :image
end
