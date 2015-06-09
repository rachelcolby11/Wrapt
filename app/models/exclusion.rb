class Exclusion < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates_presence_of :user, :item
end
