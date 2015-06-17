class UserProfile < ActiveRecord::Base
  belongs_to :user

  def next_birthday
    year = Date.today.year
    year += 1 if Date.today.month >= 10
    if birthdate
      Date.new(year, birthdate.month, birthdate.day).to_date 
    else
      false
    end
  end

end
