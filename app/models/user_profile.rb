class UserProfile < ActiveRecord::Base
  belongs_to :user

  def next_birthday
    this_year = Date.today.year
    next_year = this_year + 1
    if birthdate
      birthday_this_year = Date.new(this_year, birthdate.month, birthdate.day).to_date 
      if birthday_this_year.past?
        Date.new(next_year, birthdate.month, birthdate.day).to_date
      else
        birthday_this_year
      end
    else
      false
    end
  end

end
