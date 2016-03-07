class Claim < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates_presence_of :user, :item

  def age_in_days
    (DateTime.now.to_date - created_at.to_date).to_i
  end

  def self.claims_to_remind
    if Rails.env.production?
     Claim.where('EXTRACT(days FROM now() - created_at) = 7')
    else
      Claim.where("created_at = ?", 7.days.ago)
    end
  end

end

