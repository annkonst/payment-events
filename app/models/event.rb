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
    users_sum = lists_sum = 0
    product_lists.each { |list| lists_sum += list.price.to_f }
    invites.each { |invite| users_sum += invite.user_money }
    lists_sum == 0 || lists_sum != users_sum
  end

  def buyers_absent?
    buyers_amount = 0
    product_lists.each { |list| buyers_amount += list.users.count }
    buyers_amount.zero?
  end
end
