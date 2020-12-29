class CreateHostProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :host_profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false

      t.date :birthday, null: false

      t.string :phone_number, null: false
      
      t.integer :postcode, null: false
      t.string :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building

      t.integer :sex, null: false

      t.text :introduction
      t.string :image

      t.timestamps
    end
  end
end
