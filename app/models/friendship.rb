class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :buddy, class_name: "User", foreign_key: "buddy_id"
end