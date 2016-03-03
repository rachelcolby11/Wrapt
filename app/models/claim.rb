class Claim < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates_presence_of :user, :item

  def age_in_days
    (DateTime.now.to_date - created_at.to_date).to_i
  end

  def self.claims_to_remind
    claims_to_remind = []
    Claim.all.each do |claim|
      if claim.age_in_days == 7
        claims_to_remind << claim
      end
    end
    claims_to_remind
  end

end

