class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorite_small_gifts, :string
    add_column :users, :desired_gift_cards, :string
    add_column :users, :notes, :text
  end
end
