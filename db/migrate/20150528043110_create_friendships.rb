class CreateFriendships < ActiveRecord::Migration
  class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, index: true
      t.integer :buddy_id

      t.timestamps null: false
    end
    add_foreign_key :friendships, :users
    add_index :friendships, :buddy_id
  end

end
