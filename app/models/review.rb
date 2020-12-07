class Review < ApplicationRecord

  validates :title, presence: true, length: { minimum: 35 }

end
