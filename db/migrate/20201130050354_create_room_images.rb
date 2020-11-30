class CreateRoomImages < ActiveRecord::Migration[6.0]
  def change
    create_table :room_images do |t|
      t.references :room, null: false, foreign_key: true
      t.string :image, null: false

      t.timestamps
    end
  end
end
