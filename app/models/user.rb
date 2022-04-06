class User < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :events
  has_many :reservations
  # フォロー機能
  has_many :active_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :followed
  # チャット機能
  has_many :user_rooms
  has_many :chats
  # 通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  # has_many :reserve, through: :reservations, source: :reserved


  validates :last_name, presence: true, format:{ with:  /\A[一-龥]+\z/}
  validates :first_name, presence: true, format:{ with:  /\A[一-龥]+\z/}
  validates :last_name_kana, presence: true,format:{ with:  /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, presence: true,format:{ with:  /\A[ァ-ヶー－]+\z/}
  validates :nationality, presence: true, format:{ with:  /\A[一-龥]+\z/}
  validates :post_code, presence: true, format:{ with:  /\A\d{7}\z/}
  validates :address, presence:true
  validates :email, presence:true
  validates :phone_number, presence: true,format:{ with:  /\A\d{10,11}\z/}


  def followed_by?(user)
    passive_relationships.find_by(followed_id: user.id).present?
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? ",current_user.id, id])
    if temp.blank?
      notification = current_user.active_notifications.new(visited_id: id, action: 'follow')
      notification.save if notification.valid?
    end
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end

