class Event < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :reservations
  has_many :notifications, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :event_name, presence: true
  validates :content, presence: true
  validates :entry_fee, presence: true
  validates :entry_fee_detail, presence: true
  validates :event_status, presence: true
  validates :venue, presence: true
  validates :event_address, presence: true
  validates :event_date, presence: true
  validates :image, presence: true

  def created_by?(user)
    reservations.find_by(user_id: user.id).present?
  end

enum event_status: { seeking: 0, will_be_held: 1, full: 2, finish: 3, cancel: 4 }

end
