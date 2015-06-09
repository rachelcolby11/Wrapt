class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :buddy, class_name: "User", foreign_key: "buddy_id"

  validates_presence_of :user, :buddy
end