class UserProfilePolicy < ApplicationPolicy

  user.present? && ((record.user == user) || user.admin? || (record.user.buddies.include? user))
  
end