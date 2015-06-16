class UserProfile < ActiveRecord::Base
  belongs_to :user

  def birthdate_month_day
    year = Date.today.year
    year += 1 if Date.today.month > 10
    Date.new(Date.today.year, birthdate.month, birthdate.day) if birthdate
  end
end
