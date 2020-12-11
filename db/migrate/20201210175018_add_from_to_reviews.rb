class AddFromToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :from, :string
  end
end
