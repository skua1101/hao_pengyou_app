class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def created_by?(user)
    reservations.find_by(user_id: user.id).present?
  end
end
