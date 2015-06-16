class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :items, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_many :claims, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :buddies, through: :friendships, class_name: "User", foreign_key: "buddy_id"
  has_many :exclusions, dependent: :destroy

  validates_presence_of :name

  def admin?
    admin == true
  end

  def claimed_items
    claims.collect(&:item)
  end

  def excluded_from?(item)
    exclusions.where(item_id: item.id).first
  end

  def friended_by
    # This method returns an array of who had added the user as a friend, i.e. whose gift lists the user can see.
    Friendship.where(buddy_id: id).collect(&:user)
  end

  def send_email_invite_from(current_user)
    InviteMailer.new_invite(current_user, self.email).deliver_now
  end

  def birthdays
    buddies.user_profiles.collect(&:birthdate)
  end

  def upcoming_birthday_friends
    friended_by.collect {|friend| friend.user_profile && friend.user_profile.birthdate && (friend.user_profile.next_birthday >= Date.today && friend.user_profile.next_birthday <= (Date.today + 3.months)) }
  end

end
