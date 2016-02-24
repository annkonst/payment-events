class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invites, dependent: :destroy
  has_many :product_lists, dependent: :destroy
  validates :date, presence: true
  validates :name, presence: true, uniqueness: { scope: :date, message: I18n.t(:same_event_exists) }
  validate :date_cannot_be_in_the_past
  FIXED = 1
  NOTFIXED = 0

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date < Date.today
  end

  def user_money(user_id)
    invites.where(user_id: user_id).first.user_money
  end

  def sums_are_equal?
    users_sum = lists_sum = 0
    product_lists.each { |list| lists_sum += list.price.to_f }
    invites.each { |invite| users_sum += invite.user_money }
    lists_sum != 0 && lists_sum == users_sum
  end

  def buyers_absent?
    buyers_amount = 0
    product_lists.each { |list| buyers_amount += list.users.count }
    buyers_amount.zero?
  end
end
