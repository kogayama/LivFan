class AddChangeToHostProfiles < ActiveRecord::Migration[6.0]
  def change
    add_reference :host_profiles, :host, null: false, foreign_key: true
  end
end
