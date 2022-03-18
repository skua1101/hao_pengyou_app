class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :reservations
  has_many :active_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :followed

  has_many :reserve, through: :reservations, source: :reserved

  def followed_by?(user)
    passive_relationships.find_by(followed_id: user.id).present?
  end
end
