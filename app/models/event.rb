class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invites,  dependent: :destroy
  has_many :product_lists, dependent: :destroy
  validates :name, :date, presence: true
  FIXED = 1
  NOTFIXED = 0
  scope :with_invited_users, ->(id){ includes(:invites).includes(:invites => [:user]).find(id) }
end
