class Item < ActiveRecord::Base
  belongs_to :user
  has_one :claim, dependent: :destroy
end
