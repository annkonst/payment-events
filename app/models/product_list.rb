class ProductList < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :products, dependent: :destroy
  validates :name, presence: true
  before_destroy { users.clear }

  def users_count
    @users_count ||= users.count
  end

  def average_price
    price / users_count
  end
end
