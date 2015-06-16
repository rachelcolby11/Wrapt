class WelcomeController < ApplicationController
  def index

  end

  def about
    
  end

  def dashboard
    @upcoming_birthdays = current_user.upcoming_birthday_buddies
  end

end
