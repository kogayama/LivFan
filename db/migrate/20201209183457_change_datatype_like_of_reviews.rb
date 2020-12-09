class ChangeDatatypeLikeOfReviews < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :like, :float
  end
end
