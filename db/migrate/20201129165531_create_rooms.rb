class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :home_type, null: false
      t.string :room_type, null: false
      t.integer :member, null: false
      t.integer :price, null: false
      t.integer :bed, null: false
      t.integer :bath, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :location, null: false
      t.boolean :is_tv, default: false, null: false
      t.boolean :is_kitchen, default: false, null: false
      t.boolean :is_air, default: false, null: false
      t.boolean :is_heater, default: false, null: false
      t.boolean :is_wifi, default: false, null: false
      t.boolean :done, default: false, null: false
      t.boolean :pet, default: false, null: false
      t.boolean :parking, default: false, null: false
      t.boolean :breakfast, default: false, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
