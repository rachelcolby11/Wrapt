class ExclusionPolicy < ApplicationPolicy

  def destroy?
    create?
  end

end