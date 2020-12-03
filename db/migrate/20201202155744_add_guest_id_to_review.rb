class AddGuestIdToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :guest, null: false, foreign_key: true
  end
end
