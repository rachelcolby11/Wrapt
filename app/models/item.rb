class Item < ActiveRecord::Base
  belongs_to :user
  has_one :claim, dependent: :destroy
  has_many :exclusions, dependent: :destroy

  validates_presence_of :user, :name
end
