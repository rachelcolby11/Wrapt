class UpdateBirthdayColumn < ActiveRecord::Migration
  def change
    remove_column :user_profiles, :birthday
    add_column :user_profiles, :birthdate, :datetime
  end
end
