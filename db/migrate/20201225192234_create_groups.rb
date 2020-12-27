class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :concept, null: false
      t.text :introduction 
      t.index :concept, unique: true
      t.timestamps
    end
  end
end
