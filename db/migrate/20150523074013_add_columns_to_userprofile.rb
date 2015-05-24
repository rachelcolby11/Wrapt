class AddColumnsToUserprofile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :birthday, :string
    add_column :user_profiles, :favorite_color, :string
    add_column :user_profiles, :favorite_small_gifts, :string
    add_column :user_profiles, :desired_gift_cards, :string
  end
end
