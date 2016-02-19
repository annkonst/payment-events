class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invites, dependent: :destroy
  has_many :product_lists, dependent: :destroy
  validates :name, :date, presence: true
  validates :name, uniqueness: { scope: :date, message: I18n.t(:same_event_exists) }
  FIXED = 1
  NOTFIXED = 0

  def user_money(user_id)
    invites.where(user_id: user_id).first.user_money
  end
end
