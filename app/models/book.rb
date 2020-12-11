class Book < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_one :guest_review
  has_one :host_review
end
