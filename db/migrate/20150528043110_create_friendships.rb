class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, index: true
      t.references :buddy, index: true

      t.timestamps null: false
    end
    add_foreign_key :friendships, :users
    add_foreign_key :friendships, :buddies
  end
end
