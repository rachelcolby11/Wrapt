class CreateExclusions < ActiveRecord::Migration
  def change
    create_table :exclusions do |t|
      t.references :user, index: true
      t.references :item, index: true

      t.timestamps null: false
    end
    add_foreign_key :exclusions, :users
    add_foreign_key :exclusions, :items
  end
end
