class Claim < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates_presence_of :user, :item

  def age_in_days
    (DateTime.now.to_date - created_at.to_date).to_i
  end

  def claims_to_remind
    Claim.where(age_in_days = 7)
  end

end
