class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invites, dependent: :destroy
  has_many :product_lists, dependent: :destroy
  validates :date, presence: true
  validates :name, presence: true, uniqueness: { scope: :date, message: I18n.t(:same_event_exists) }
  FIXED = 1
  NOTFIXED = 0

  def unavailable_to_calculate
    if product_lists.count.zero?
      I18n.t(:create_list_of_products_and_add_product_to_list)
    elsif buyers_absent?
      I18n.t(:buyers_are_absent)
    elsif sums_are_not_equal?
      I18n.t(:sums_dont_equal)
    end
  end

  def user_money(user_id)
    invites.where(user_id: user_id).first.user_money
  end

  def sums_are_not_equal?
    lists_sum = product_lists.sum(:price)
    lists_sum.zero? || lists_sum != invites.sum(:user_money)
  end

  def buyers_absent?
    product_lists.joins(:users).count.zero?
  end
end
