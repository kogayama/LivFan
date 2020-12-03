class AddHostIdToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :host, null: false, foreign_key: true
  end
end
