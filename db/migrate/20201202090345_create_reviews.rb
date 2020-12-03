class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :comment
      t.integer :like, default: 1
      t.references :room, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
