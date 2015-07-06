class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invites,  dependent: :destroy
  has_many :product_lists, dependent: :destroy
  FIXED = 1
  NOTFIXED = 0
end
