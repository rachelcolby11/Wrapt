class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.text :notes
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_profiles, :users
  end
end
