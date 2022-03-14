class Event < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :reservations

enum event_status: { seeking: 0, will_be_held: 1, full: 2, finish: 3 }

end
