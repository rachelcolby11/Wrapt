 class ItemPolicy < ApplicationPolicy

  def index? 
    user.present? && user.admin?
  end