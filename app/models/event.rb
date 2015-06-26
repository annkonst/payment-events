class Event < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :invites,  dependent: :destroy
  has_many :product_lists, dependent: :destroy
end
