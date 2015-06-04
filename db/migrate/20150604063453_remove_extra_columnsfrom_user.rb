class RemoveExtraColumnsfromUser < ActiveRecord::Migration
  def change
    remove_column :users, :birthday
    remove_column :users, :favorite_color, :string
    remove_column :users, :favorite_small_gifts, :string
    remove_column :users, :desired_gift_cards, :string
  end
end
