class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms
  has_many :books, dependent: :destroy

  has_many :guest_reviews, class_name: "GuestReview", foreign_key: "guest_id"
  has_many :host_reviews, class_name: "HostReview", foreign_key: "host_id"

  has_many :group_users
  has_many :groups, through: :group_users


  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  validates :password, presence: true, length: { minimum: 7 }, on: :create
  validates :password_confirmation, presence: true, on: :create


  validates :introduction, length: { maximum: 250 }
  mount_uploader :image, ImageUploader

  def user_like_aved(user)
    if (user.guest_reviews.count > 0) || (user.host_reviews.count > 0)
      guest_like = user.guest_reviews.average(:like).to_f.round(2)
      return guest_like
      host_like = host_reviews.average(:like).to_i.round(2)
      return (guest_like + host_like / 2).round(2)
    else
      return 0
    end
  end

  def user_like_ave(user)
    if (user.guest_reviews.count > 0) || (user.host_reviews.count > 0)
      guest_like = user.guest_reviews.average(:like).to_f.round(2)
      return guest_like
      host_like = host_reviews.average(:like).to_i.round(2)
      return (guest_like + host_like / 2).round(2)
    else
      return 0
    end
  end
end
