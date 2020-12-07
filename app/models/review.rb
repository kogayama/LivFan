class Review < ApplicationRecord

  validates :title, presence: true, length: { maximum: 35 }

end
