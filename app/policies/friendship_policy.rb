class FriendshipPolicy < ApplicationPolicy

  def destroy?
    user.present? && (record.user == user || user.admin? || record.user == buddy)
  end

end