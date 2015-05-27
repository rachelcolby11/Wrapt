class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.references :user, index: true
      t.references :item, index: true

      t.timestamps null: false
    end
    add_foreign_key :claims, :users
    add_foreign_key :claims, :items
  end
end
