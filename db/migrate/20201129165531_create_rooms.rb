class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :home_type, null: false
      t.string :room_type, null: false
      t.integer :member, null: false
      t.integer :bed, null: false
      t.integer :bath, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :location, null: false
      t.boolean :is_tv
      t.boolean :is_kitchen
      t.boolean :is_air
      t.boolean :is_heater
      t.boolean :is_wifi
      t.boolean :active
      t.boolean :pet
      t.boolean :parking
      t.boolean :breakfast
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
