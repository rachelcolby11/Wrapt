class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :items
  has_one :user_profile
  has_many :claims, dependent: :destroy
  has_many :friendships
  has_many :buddies, through: :friendships, class_name: "User", foreign_key: "buddy_id"

  def claimed(item)
   claims.where(item_id: item.id).first
  end

  def friended_by
    # This method returns an array of who had added the user as a friend, i.e. whose gift lists the user can see.
    Friendship.where(buddy_id: id).collect(&:user)
  end
end
