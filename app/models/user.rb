class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :items
  has_one :user_profile
  has_many :claims, dependent: :destroy

  def claimed(item)
   claims.where(item_id: item.id).first
  end
end
