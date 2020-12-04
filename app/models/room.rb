class Room < ApplicationRecord
  belongs_to :user
  has_many :room_images
  has_many :books

  has_many :guest_reviews

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :member, presence: true
  validates :price, presence: true
  validates :bed, presence: true
  validates :bath, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :location, presence: true

  
end
