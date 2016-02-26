class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invites, dependent: :destroy
  has_many :product_lists, dependent: :destroy
  validates :date, presence: true, date: { after_or_equal_to: Date.today }
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

  def debts_calculation
    debts_hash = Hash.new(0)
    product_lists.each do |list|
      list.users.each { |user| debts_hash[user.id] += list.average_price }
    end
    invites.where(state: Invite::ACCEPT).each do |invited_user|
      debts_hash[invited_user.user_id] = 0 unless invited_user.user_money.zero? || debts_hash.include?(invited_user.user_id)
    end
    debts_hash.map { |user_id, money_required| Participant.new(user_id, money_required, self) }
  end

  def user_money(user_id)
    invites.where(user_id: user_id).first.user_money
  end

  def sums_are_not_equal?
    lists_sum = product_lists.inject(0) { |sum, list| list.users.count != 0 ? sum + list.price : sum }
    lists_sum.zero? || lists_sum != invites.sum(:user_money)
  end

  def buyers_absent?
    product_lists.joins(:users).count.zero?
  end
end
