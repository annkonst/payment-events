class ProductList < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  before_destroy { users.clear }

  def average_price
    price / users.count
  end
end
