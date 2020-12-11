class GuestReview < Review
  belongs_to :guest, class_name: "User"

  belongs_to :room
end
