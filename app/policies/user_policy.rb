class UserPolicy < ApplicationPolicy
  
  def show?
    user.present? && ((record.user == user) || user.admin? )
  end

  def profile?
    user.present?
  end

end